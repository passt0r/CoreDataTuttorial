//
//  Walk+CoreDataProperties.swift
//  Dog Walk
//
//  Created by Dmytro Pasinchuk on 08.09.17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension Walk {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Walk> {
        return NSFetchRequest<Walk>(entityName: "Walk")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var dog: Dog?

}
