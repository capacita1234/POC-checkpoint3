//
//  ContentView.swift
//  ois.equipe24
//
//  Created by iredefbmac_40 on 12/06/25.'
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShoppingViewModel()
    @State var temp1 = ""
    @State var temp2 = ""
    @State var tenp3 = [] // adjust type accordingly

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Adicionar item", content: {
                        TextField("Nome do Item", text: $temp1)
                        TextField("Categoria personalizada (opcional)", text: $temp2)
                        Button("adicionar") {
                            viewModel.addItem() // complete method call as needed
                        }
                    }
                )
            }
                List {
                    ForEach(viewModel.groupedItems().keys.sorted(), id: \.self) { category in
                        Section(category,
                            content: {
                                ForEach(viewModel.groupedItems()[category] ?? [], id: \.id) { item in
                                    Text(item.name)
                                }
                            }
                        )
                    }
                }
            }
        }
    }
}
