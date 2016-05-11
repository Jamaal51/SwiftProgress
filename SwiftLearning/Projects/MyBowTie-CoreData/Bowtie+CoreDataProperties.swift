//
//  Bowtie+CoreDataProperties.swift
//  MyBowTie-CoreData
//
//  Created by Jamaal Sedayao on 3/28/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Bowtie {

    @NSManaged var name: String?
    @NSManaged var isFavorite: NSNumber?
    @NSManaged var rating: NSNumber?
    @NSManaged var searchKey: String?
    @NSManaged var timesWorn: NSNumber?
    @NSManaged var lastWorn: NSDate?
    @NSManaged var photoData: NSData?
    @NSManaged var tintColor: NSObject?

}
