//
//  ListView.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "first title", isCompleted: false),
        ItemModel(title: "this is second title", isCompleted: true),
        ItemModel(title: "3rd title", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List 📋")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
        //        .navigationBarItems(leading: <#T##View#>, trailing: <#T##View#>)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}
