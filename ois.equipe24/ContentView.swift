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
    @State var tenp3 = []
     var body: some View {
         
       /* NavigationView{
            VStack{
                Form {
                    
                    // Section(header: {Text("Adicionar Item")}){
                    TextField("Nome do Item", text: $temp1)
                    TextField("Categoria personalizada (opcional)", text: $temp2)
                    Button("adicionar"){
                        //  viewModel.addItem()
                        //    }
                    }
                }
            }
                  List{
                      ForEach(viewModel.groupedItems.key.sorted(), id: \.self) {category in
                        Section(header: Text(category)){
                            ForEach(viewModel.groupedItems()[category] ?? []){ item in
                                Text(item.name)}
                        }}
                }
            }*/
        }
    }
}

                               
                            

