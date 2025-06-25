//
//  iTour_SwiftDataApp.swift
//  iTour-SwiftData
//
//  Created by Sajid Shanta on 25/6/25.
//

import SwiftData
import SwiftUI

@main
struct iTour_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
