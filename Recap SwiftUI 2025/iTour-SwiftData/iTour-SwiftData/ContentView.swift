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
    //    @Query(sort: \Destination.name) var destinations: [Destination]
    /*    @Query(sort: \Destination.name, order: .reverse) var destinations: [Destination]*/
//    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
//    @Query var destinations: [Destination]
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Destination", action: addDestination)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name").tag(SortDescriptor(\Destination.name))
                            Text("Priority").tag(SortDescriptor(\Destination.priority, order: .reverse))
                            Text("Date").tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
//    func addSamples() {
//        let dhaka = Destination(name: "Dhaka")
//        let bogura = Destination(name: "Bogura")
//        let rome = Destination(name: "Rome")
//        
//        modelContext.insert(dhaka)
//        modelContext.insert(bogura)
//        modelContext.insert(rome)
//    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        self.path = [destination]
    }
    

}

#Preview {
    ContentView()
        .modelContainer(for: Destination.self, inMemory: true)
}
