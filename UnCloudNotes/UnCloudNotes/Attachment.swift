//
//  Attachment.swift
//  UnCloudNotes
//
//  Created by Dmytro Pasinchuk on 22.09.17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class Attachment: NSManagedObject {
  @NSManaged var dateCreated: Date
  @NSManaged var note: Note?
}
