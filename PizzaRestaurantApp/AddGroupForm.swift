//
//  AddGroupForm.swift
//  PizzaRestaurantApp
//
//  Created by admin on 5/21/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct AddGroupForm: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    @State var type: String = ""
    
    var submitButton: some View {
        Button("Done", action: {
            let newGroup = Group(context: self.managedObjectContext)
            newGroup.type = self.type
            newGroup.id = UUID()
            do {
                try self.managedObjectContext.save()
                print("Group saved.")
                print(newGroup)
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error)
            }
        })
    }
    
    var body: some View {
            VStack {
                TextField("Type", text: self.$type)
            }
            .navigationBarItems(trailing: self.submitButton)
        }
}

struct AddGroupForm_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupForm()
    }
}
