//
//  ListRowView.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let item = ItemModel(title: "Title from preview", isCompleted: false)
    ListRowView(item: item)

//    .previewLayout(.sizeThatFits) // no replace ment till now!! traits: .sizeThatFitsLayout also didn't work
    
}

#Preview() {
    let item = ItemModel(title: "2nd from preview", isCompleted: true)
    ListRowView(item: item)
}
