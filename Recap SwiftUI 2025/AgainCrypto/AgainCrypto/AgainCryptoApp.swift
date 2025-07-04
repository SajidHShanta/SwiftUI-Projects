//
//  AgainCryptoApp.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 23/6/25.
//

import SwiftUI

@main
struct AgainCryptoApp: App {
    
    @StateObject private var vm = HomeVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
//                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
