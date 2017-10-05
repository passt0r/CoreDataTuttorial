//
//  EmployeePicture.swift
//  EmployeeDirectory
//
//  Created by Dmytro Pasinchuk on 04.10.17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit
import CoreData

class EmployeePicture: NSManagedObject {
  @NSManaged var picture: Data
  @NSManaged var employee: EmployeeDirectory.Employee
}
