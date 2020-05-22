//
//  ContactsList.swift
//  PizzaRestaurantApp
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ContactsList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
       
//    @FetchRequest(entity: Contact.entity(), sortDescriptors: [])
    @FetchRequest(fetchRequest: Contact.getAllContacts()) var allContacts: FetchedResults<Contact>
    @FetchRequest(fetchRequest: Group.getAllGroups()) var allGroups: FetchedResults<Group>
//    var allContacts: FetchedResults<Contact>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.allGroups){group in
                    Section(header: Text(group.type)){
                        ForEach(self.allContacts) { contact in
                            if contact.group == group.type {
                                HStack {
                                    VStack(alignment: .leading) {
                                        NavigationLink(destination: ContactDetail(contact: contact)){
                                            Text("\(contact.name)")
                                                .font(.headline)
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                self.managedObjectContext.delete(self.allContacts[index])
                                do {
                                    try self.managedObjectContext.save()
                                    print("Contact Deleted.")
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }
                }
            }
            /* List {
                ForEach(allGroups) { group in
                    Text(group.type)
                }
            } */
            .navigationBarTitle("All Contacts")
                .navigationBarItems(leading: NavigationLink(destination: AddGroupForm()){
                    Text("Add new group").foregroundColor(.primary)
                    }, trailing: NavigationLink(destination: OrderSheet()){
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                })
        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
