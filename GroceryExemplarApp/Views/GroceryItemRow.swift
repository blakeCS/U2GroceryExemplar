//
//  GroceryItemRow.swift
//  GroceryExemplarApp
//
//  Created by Madeline Burton on 4/4/23.
//

import SwiftUI

struct GroceryItemRow: View {
    var item: GroceryItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("Quantity: \(item.quantity)")
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(item.store)
                    .font(.subheadline)
                Text("Priority: \(item.priority.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(priorityColor(priority: item.priority))
            }
        }
    }
    
    private func priorityColor(priority: Priority) -> Color {
        switch priority {
        case .low:
            return .green
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
}

