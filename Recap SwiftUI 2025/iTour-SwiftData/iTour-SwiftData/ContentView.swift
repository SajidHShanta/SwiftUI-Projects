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
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)
                            
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                Button("Add Destination", action: addDestination)
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
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        self.path = [destination]
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Destination.self, inMemory: true)
}
