//
//  GroceryListView.swift
//  GroceryExemplarApp
//
//  Created by Madeline Burton on 4/4/23.
//

import SwiftUI

struct GroceryListView: View {
    @ObservedObject var viewModel = GroceryListViewModel()
    @State private var showAddItemView = false
    @State private var selectedStore: String = "All Stores"
    
    var body: some View {
        NavigationView {
            ZStack{
                Image(selectedStore)
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .brightness(0.2)
                VStack {
                    Picker("Store", selection: $selectedStore) {
                        Text("All Stores").tag("All Stores")
                        ForEach(stores, id: \.self) { store in
                            Text(store).tag(store)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.leading)
                    .padding(.trailing)
                    .offset(y:-20)
                    
                    if selectedStore == "All Stores"{
                        List {
                            ForEach(viewModel.items) { item in
                                GroceryItemRow(item: item)
                            }
                            .onDelete(perform: viewModel.removeItem)
                        }
                        .scrollContentBackground(.hidden)
                    } else{
                        List {
                            ForEach(viewModel.filteredItems(by: selectedStore)) { item in
                                GroceryItemRow(item: item)
                            }
                            .onDelete(perform: viewModel.removeItem)
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
                .padding()
                .navigationBarTitle("Grocery List")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: {
                        showAddItemView = true
                    }) {
                        Image(systemName: "plus")
                    })
                .sheet(isPresented: $showAddItemView) {
                    AddGroceryItemView { newItem in
                        viewModel.addItem(item: newItem)
                        showAddItemView = false
                    }
                }
            }
        }
    }
}


struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView()
    }
}
