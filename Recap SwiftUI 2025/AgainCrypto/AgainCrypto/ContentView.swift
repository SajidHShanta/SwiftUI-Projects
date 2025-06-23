//
//  ContentView.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 23/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Accet Color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary text color")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}
 
#Preview {
    ContentView()
}
