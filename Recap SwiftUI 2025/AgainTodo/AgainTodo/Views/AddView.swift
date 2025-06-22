//
//  AddView.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import SwiftUI

struct AddView: View {
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ListVM
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something here..", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.opaqueSeparator))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: saveBtnPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(alertTitle, isPresented: $showAlert, actions: {
            
        })
    }
    
    func saveBtnPressed() {
        if isValidTitle() {
            vm.addItem(title: textFieldText)
            //        presentationMode.wrappedValue.dismiss()
            dismiss()
        } else {
            alertTitle = "Title must contain at least 3 characters"
            showAlert.toggle()
        }
    }
    
    func isValidTitle() -> Bool {
        !(textFieldText.count < 3)
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListVM())
}
