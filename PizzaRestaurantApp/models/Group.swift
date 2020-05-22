//
//  Group.swift
//  PizzaRestaurantApp
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Foundation
import CoreData


public class Group: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID?
    @NSManaged public var type: String
//    @NSManaged public var members: [String]?
//    @NSManaged public var thankyouTemplate: String?
//    @NSManaged public var thankyouItems: Dictionary<String, String>?

}

extension Group {

    static func getAllGroups() -> NSFetchRequest<Group> {
//        return NSFetchRequest<Group>(entityName: "Group")
        
        let request: NSFetchRequest<Group> = Group.fetchRequest() as! NSFetchRequest<Group>
        request.sortDescriptors = []
        return request
    }
}

