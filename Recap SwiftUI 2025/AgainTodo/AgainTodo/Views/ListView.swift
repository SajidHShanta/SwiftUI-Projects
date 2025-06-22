//
//  ListView.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var vm: ListVM
    
    var body: some View {
        ZStack {
            if vm.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.updateItem(item: item)
                                }

                            }
                    }
                    .onDelete(perform: vm.deletItem)
                    .onMove(perform: vm.moveItem)
                }
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
    .environmentObject(ListVM())
}
