import SwiftUI

struct OrderSheet: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    @FetchRequest(fetchRequest: Group.getAllGroups()) var allGroups: FetchedResults<Group>
    
//    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
//    @State var selectedPizzaIndex = 1
//    @State var numberOfSlices = 1
//    @State var tableNumber = ""
    @State var name = ""
    @State var company = ""
    @State var position = ""
    @State var selectedGroupIndex = "None"
    
    @State var place = ""
    @State var conv = ""
    @State var align = ""
    @State var help = ""
    
//    func loadGroups() -> [Group]? {
//        let managedContext = appDelegate.managedObjectContext
//        let fetchRequest = NSFetchRequest(entityName: "CLIENTS")
//        var mobClients = [NSManagedObject]()
//        var arrayAllPhoneNumbers = [String]()
//
//        do {
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            mobClients = results as! [NSManagedObject]
//
//            arrayAllPhoneNumbers = mobClients.map({ clientPhoneNumber in
//                clientPhoneNumber.valueForKey("clientsMobilePhoneNumber") as! String
//            })
//            messageVC.recipients = arrayAllPhoneNumbers
//        } catch
//            let error as NSError {
//                print("Could not fetch \(error), \(error.userInfo)")
//        }
//    }
    
    var submitButton: some View {
        Button("Done", action: {
            let newContact = Contact(context: self.managedObjectContext)
            newContact.name = self.name
            newContact.createdAt = Date()
            newContact.company = self.company
            newContact.position = self.position
            print(self.selectedGroupIndex)
            newContact.group = self.selectedGroupIndex
            let notes = ["place": self.place, "conv": self.conv, "align": self.align, "help": self.help]
            newContact.notes = notes
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
        VStack {
            TextField("Name", text: self.$name)
            TextField("Company", text: self.$company)
            TextField("Position", text: self.$position)
            TextField("Where did you meet?", text: self.$place)
            TextField("What did you discuss?", text: self.$conv)
            TextField("Anything you can help with?", text: self.$help)
            
            
            Picker(selection: $selectedGroupIndex, label: Text("Group")) {
                Text("None")
                ForEach(self.allGroups, id: \.type) { group in
                    Text(group.type).tag(group.type)
                }
            }
//
//                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                
            
            
        }
        .navigationBarItems(trailing: self.submitButton)
    }
}


struct OrderSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheet(selectedGroupIndex: "")
    }
}
