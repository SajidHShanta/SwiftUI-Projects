//
//  ItemModel.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
