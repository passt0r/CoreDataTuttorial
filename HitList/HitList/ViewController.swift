//
//  ViewController.swift
//  HitList
//
//  Created by Dmytro Pasinchuk on 06.09.17.
//  Copyright © 2017 Dmytro Pasinchuk. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var people: [NSManagedObject] = []

    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
            let nameToAdd = textField.text else {
                return
            }
            self.save(name: nameToAdd)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managetContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managetContext)!
        let person = NSManagedObject(entity: entity, insertInto: managetContext)
        person.setValue(name, forKey: "name")
        do {
            try managetContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Coundn't save \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Coundn't fetch \(error), \(error.userInfo)")
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        return cell
    }
}

