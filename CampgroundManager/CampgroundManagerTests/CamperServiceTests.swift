//
//  CamperServiceTests.swift
//  CampgroundManagerTests
//
//  Created by Dmytro Pasinchuk on 25.09.17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest
import CampgroundManager
import CoreData

class CamperServiceTests: XCTestCase {
  
  // MARK: Properties
  var camperService: CamperService!
  var coreDataStack: CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        camperService = CamperService(managedObjectContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
    }
    
    override func tearDown() {
        coreDataStack = nil
        camperService = nil
        super.tearDown()
    }
    
  func testAddCamper() {
    let camper = camperService.addCamper("Bacon Lover", phoneNumber: "910-543-9000")
    
    XCTAssertNotNil(camper, "Camper should not be nil")
    XCTAssertTrue(camper?.fullName == "Bacon Lover")
    XCTAssertTrue(camper?.phoneNumber == "910-543-9000")
    
  }
  
  func testRootContextIsSavedAfterAddingCamper() {
    let derivedContext = coreDataStack.newDerivedContext()
    camperService = CamperService(managedObjectContext: derivedContext, coreDataStack: coreDataStack)
    
    expectation(forNotification: NSNotification.Name.NSManagedObjectContextDidSave.rawValue, object: coreDataStack.mainContext) { (notification) -> Bool in
      return true
    }
    
    let camper = camperService.addCamper("Bacon Lover",
                                         phoneNumber: "910-543-9000")
    XCTAssertNotNil(camper)
    
    waitForExpectations(timeout: 2.0) { error in
      XCTAssertNil(error, "Save did not occur")
    }
  }
}
