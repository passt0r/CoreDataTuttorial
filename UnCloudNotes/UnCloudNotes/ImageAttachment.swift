//
//  ImageAttachment.swift
//  UnCloudNotes
//
//  Created by Dmytro Pasinchuk on 23.09.17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit
import CoreData
class ImageAttachment: Attachment {
  @NSManaged var image: UIImage?
  @NSManaged var width: Float
  @NSManaged var height: Float
  @NSManaged var caption: String
}
