
//  ShoppingViewModel.swift
//  ois.equipe24
//
//  Created by iredefbmac_40 on 16/06/25.
//

import SwiftUI

struct ShoppingIdentifiable {
    let id = UUID()
    var name: String
    var category: String
}

class ShoppingViewModel: ObservableObject {
    @Published var items: [ShoppingIdentifiable] = []
    @Published var newItemName: String = ""
    @Published var customCategory: String = ""

    private let automaticCategories: [String: [String]] = [
        "Alimentos": ["arroz", "feijão", "leite", "ovo"],
        "Limpeza": ["sabão", "detergente", "desinfetante", "esponja"],
        "Higiene": ["pasta", "escova", "shampoo", "sabonete"]
    ]

    func addItem() {
        let trimmedName = newItemName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedCategory = customCategory.trimmingCharacters(in: .whitespacesAndNewlines)

        // Evita adicionar itens com nome vazio
        guard !trimmedName.isEmpty else { return }

        let nameLower = trimmedName.lowercased()
        var assignedCategory = "Outros"

        for (category, keywords) in automaticCategories {
            if keywords.contains(where: { nameLower.contains($0) }) {
                assignedCategory = category
                break
            }
        }

        if !trimmedCategory.isEmpty {
            assignedCategory = trimmedCategory
        }

        let newItem = ShoppingIdentifiable(name: trimmedName, category: assignedCategory)
        items.append(newItem)

        newItemName = ""
        customCategory = ""
    }

    func groupedItems() -> [String: [ShoppingIdentifiable]] {
        Dictionary(grouping: items, by: { $0.category })
    }
}

