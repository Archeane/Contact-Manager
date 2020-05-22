//
//  Group+CoreDataClass.swift
//  PizzaRestaurantApp
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Group)
public class Group: NSManagedObject {
    @NSManaged public var type: String
   @NSManaged public var thankyouItems: Dictionary<String, String>
   @NSManaged public var thankyouTemplate: String
   @NSManaged public var memebrs: [Contact]
   @NSManaged public var id: UUID
}
