//File: Order+CoreDataClass.swift
//Project: PizzaRestaurantApp

//Created at 31.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.
//

import Foundation
import CoreData

@objc(Contact)
public class Contact: NSManagedObject {
    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var company: String
    @NSManaged public var createdAt: Date
    @NSManaged public var position: String
    @NSManaged public var group: String
    @NSManaged public var notes: Dictionary<String, String>

}
