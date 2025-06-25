//
//  ContentView.swift
//  ois.equipe24
//
//  Created by iredefbmac_40 on 12/06/25.'
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShoppingViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Adicionar item") {
                        TextField("Nome do Item", text: $viewModel.newItemName)
                        TextField("Categoria personalizada (opcional)", text: $viewModel.customCategory)
                        Button("Adicionar") {
                            viewModel.addItem()
                        }
                    }
                }

                List {
                    ForEach(viewModel.groupedItems().keys.sorted(), id: \.self) { category in
                        Section(header: Text(category)) {
                            ForEach(viewModel.groupedItems()[category] ?? [], id: \.id) { item in
                                Text(item.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Lista de Compras")
        }
    }
}
