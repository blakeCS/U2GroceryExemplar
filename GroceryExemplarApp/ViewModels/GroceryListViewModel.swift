//
//  GroceryListViewModel.swift
//  GroceryExemplarApp
//
//  Created by Madeline Burton on 4/4/23.
//

import Foundation


class GroceryListViewModel: ObservableObject {
    @Published var items = [GroceryItem]()
    
    func addItem(item: GroceryItem) {
        items.append(item)
    }
    
    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func filteredItems(by store: String) -> [GroceryItem] {
        return items.filter { $0.store == store }
    }
}
