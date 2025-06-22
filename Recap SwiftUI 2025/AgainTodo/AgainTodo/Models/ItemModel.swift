//
//  ItemModel.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import Foundation

struct ItemModel: Identifiable{
    var id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
