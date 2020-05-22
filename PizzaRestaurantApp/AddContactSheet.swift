import SwiftUI

struct AddContactSheet: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    @State var name: String = ""
    
    var submitButton: some View {
        Button("Done", action: {
            let newContact = Contact(context: self.managedObjectContext)
            newContact.name = self.name
            newContact.createdAt = Date()
            newContact.id = UUID()
            do {
                try self.managedObjectContext.save()
                print("Contact saved.")
                print(newContact)
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
            }
        })
    }
    
    var body: some View {
        NavigationView {
            TextField("Name", text: self.$name)
                .navigationBarItems(trailing: self.submitButton)
        }
    }
}

struct AddContactSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddContactSheet()
    }
}
