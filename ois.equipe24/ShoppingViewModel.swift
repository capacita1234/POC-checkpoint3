
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

class ShoppingViewModel: ObservableObject{
    @Published var items: [ShoppingIdentifiable]
    @Published var newItemName = " "
    @Published var customCategory = " "
    
    private let automaticCategories: [String: [String]]
    
    init(){
        self.items = []
        self.newItemName = " "
        self.customCategory = " "
        self.automaticCategories = [
            "Alimentos": ["arroz", "feijão", "leite", "ovo"],
            "Limpeza": ["sabão", "detergente", "desinfetante", "esponja"],
            "Higiennte": ["pasta", "escova", "shapoo", "sabonete"]
        ]
    }
    
    func addItem(){
        let nameLower = newItemName.lowercased()
        var assignedCategory = "Outros"
        for(category, keywords) in automaticCategories{
            if keywords.contains(where: {nameLower.contains($0)}){
                assignedCategory = category
                break
            }
        }
        if !customCategory.isEmpty{
            assignedCategory = customCategory
        }
        let newItem = ShoppingIdentifiable(name: newItemName, category: assignedCategory)
        items.append(newItem)
        newItemName = " "
        customCategory = " "
    }
    
    func groupedItems() -> [String: [ShoppingIdentifiable]]{
        Dictionary(grouping: items, by: {$0.category})
    }
}
