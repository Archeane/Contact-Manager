//
//  Group+CoreDataProperties.swift
//  PizzaRestaurantApp
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var type: String?
    @NSManaged public var thankyouItems: NSObject?
    @NSManaged public var thankyouTemplate: String?
    @NSManaged public var memebrs: NSObject?
    @NSManaged public var id: UUID?

}
