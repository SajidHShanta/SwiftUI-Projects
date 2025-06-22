//
//  AgainTodoApp.swift
//  AgainTodo
//
//  Created by Sajid Shanta on 22/6/25.
//

import SwiftUI

@main
struct AgainTodoApp: App {
    @StateObject var listVM: ListVM = ListVM()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listVM)
        }
    }
}
