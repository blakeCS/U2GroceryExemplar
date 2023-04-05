//
//  GroceryItem.swift
//  GroceryExemplarApp
//
//  Created by Madeline Burton on 4/4/23.
//

import Foundation


let stores = ["Grocery", "Tools", "Garden"]


struct GroceryItem: Identifiable {
    var id = UUID()
    var name: String
    var quantity: Int
    var store: String
    var dateAdded: Date
    var priority: Priority
}

enum Priority: String, CaseIterable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}
