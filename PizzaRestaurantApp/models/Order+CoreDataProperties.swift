//File: Order+CoreDataProperties.swift
//Project: PizzaRestaurantApp

//Created at 31.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.
//

import Foundation
import CoreData

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

extension Contact: Identifiable {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
    static func getAllContacts() -> NSFetchRequest<Contact> {
//        return NSFetchRequest<Contact>(entityName: "Contact")
        let request: NSFetchRequest<Contact> = Contact.fetchRequest() as! NSFetchRequest<Contact>
        request.sortDescriptors = []
        return request
    }

//    @NSManaged public var id: UUID?
//    @NSManaged public var name: String
//    @NSManaged public var company: String
//    @NSManaged public var createdAt: Date
//    @NSManaged public var position: String
//    @NSManaged public var notes: Dictionary<String, String>
    
//    @NSManaged public var numberOfSlices: Int16
//    @NSManaged public var pizzaType: String
//    @NSManaged public var status: String
//    @NSManaged public var tableNumber: String
    
//    var orderStatus: Status {
//        set {status = newValue.rawValue}
//        get {Status(rawValue: status) ?? .pending}
//    }


}
//
//enum Status: String {
//    case pending = "Pending"
//    case preparing = "Preparing"
//    case completed = "Completed"
//}

