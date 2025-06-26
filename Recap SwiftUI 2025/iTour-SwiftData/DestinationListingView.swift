//
//  DestinationListingView.swift
//  iTour-SwiftData
//
//  Created by Sajid Shanta on 26/6/25.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext

    @Query var destinations: [Destination]

    var body: some View {
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
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
//        _destinations = Query(sort: [sort])
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty { return true } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
