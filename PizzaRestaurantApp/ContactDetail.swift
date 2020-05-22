//
//  ContactDetail.swift
//  PizzaRestaurantApp
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    var contact: Contact
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "heart.fill").resizable().frame(width: 30, height: 30)
                    .padding()
                VStack{
                    Text(self.contact.name).font(.title)
                    Text("\(self.contact.company), \(self.contact.position)").foregroundColor(.gray)
                }
            }
            Text("Group: \(self.contact.group)").padding()
            Text("Thank you Note Content")
            ForEach(self.contact.notes.keys.sorted(), id: \.self) { key in
                HStack {
                    Text(key)
                    Text("\(self.contact.notes[key] ?? "")")
                }
            }
            Spacer()
        }
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let coreDataObject = Contact(context: moc)
        coreDataObject.name = "Jenny Xu"
        coreDataObject.company = "Facebook"
        coreDataObject.position = "Software engineer"
        coreDataObject.group = "Engineers"
        return ContactDetail(contact: coreDataObject)
    }
}
