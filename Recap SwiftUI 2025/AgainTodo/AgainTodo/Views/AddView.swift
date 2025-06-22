//
//  AddView.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something here..", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.opaqueSeparator))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
