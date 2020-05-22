//File: ContentView.swift
//Project: PizzaRestaurantApp

//Created at 31.12.19 by BLCKBIRDS
//Visit www.BLCKBIRDS.com for more.

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
//    @FetchRequest(entity: Contact.entity(),
//                  sortDescriptors: [])
//                  predicate: NSPredicate(format: "status != %@", Status.completed.rawValue))
//
//    var orders: FetchedResults<Contact>
    
    @State var showAddContactSheet = false

    var body: some View {
        TabView {
            /*
            NavigationView {
                List {
                    ForEach(orders) { contact in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(contact.name)
                                    .font(.headline)
                            }
                            Spacer()
//                            Button(action: {self.updateOrder(order: order)}) {
//                                Text(order.orderStatus == .pending ? "Prepare" : "Complete")
//                                    .foregroundColor(.blue)
//                            }
                        }
                    }
                        .onDelete { indexSet in
                            for index in indexSet {
                                self.managedObjectContext.delete(self.orders[index])
                            }
                        }
                }
                .navigationBarTitle("All Contacts")
                .navigationBarItems(trailing: NavigationLink(destination: OrderSheet()){
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                })
//                    Button(action: {
//                    self.showAddContactSheet = true
//                }, label: {
//                    Image(systemName: "plus.circle")
//                        .resizable()
//                        .frame(width: 32, height: 32, alignment: .center)
//                }))
//                    .sheet(isPresented: $showAddContactSheet) {
//                        OrderSheet().environment(\.managedObjectContext, self.managedObjectContext)
//                    }
            }
                .tabItem {
                    Image(systemName: "1.square.fill")
                }
            */
            ContactsList()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        
    }
    
//    func updateOrder(order: Contact) {
//        let newStatus = order.orderStatus == .pending ? Status.preparing : .completed
//        managedObjectContext.performAndWait {
//            order.orderStatus = newStatus
//            try? managedObjectContext.save()
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return ContentView().environment(\.managedObjectContext, context)
    }
}
