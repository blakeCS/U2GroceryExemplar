//
//  Add GroceryItemView.swift
//  GroceryExemplarApp
//
//  Created by Madeline Burton on 4/4/23.
//

import SwiftUI

struct AddGroceryItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var itemName = ""
    @State private var itemQuantity = 1
    @State private var selectedStore = "Grocery"
    @State private var selectedPriority = Priority.low
    var onSave: (GroceryItem) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Item Name", text: $itemName)
                    Stepper(value: $itemQuantity, in: 1...99) {
                        Text("Quantity: \(itemQuantity)")
                    }
                }
                
                Section {
                    Picker("Store", selection: $selectedStore) {
                        ForEach(stores, id: \.self) { store in
                            Text(store).tag(store)
                        }
                    }
                }
                
                Section {
                    Picker("Priority", selection: $selectedPriority) {
                        ForEach(Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }
                }
            }
            .navigationBarTitle("Add Grocery Item")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let newItem = GroceryItem(name: itemName, quantity: itemQuantity, store: selectedStore, dateAdded: Date(), priority: selectedPriority)
                onSave(newItem)
            })
        }
    }
}
