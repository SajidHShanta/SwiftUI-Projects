//
//  ListVM.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import Foundation

class ListVM: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "first title", isCompleted: false),
            ItemModel(title: "this is second title", isCompleted: true),
            ItemModel(title: "3rd title", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deletItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
