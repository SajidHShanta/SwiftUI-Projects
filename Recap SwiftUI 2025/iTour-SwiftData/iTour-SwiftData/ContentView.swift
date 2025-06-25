//
//  ContentView.swift
//  iTour-SwiftData
//
//  Created by Sajid Shanta on 25/6/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        let dhaka = Destination(name: "Dhaka")
        let bogura = Destination(name: "Bogura")
        let rome = Destination(name: "Rome")
        
        modelContext.insert(dhaka)
        modelContext.insert(bogura)
        modelContext.insert(rome)
    }
}

#Preview {
    ContentView()
}
