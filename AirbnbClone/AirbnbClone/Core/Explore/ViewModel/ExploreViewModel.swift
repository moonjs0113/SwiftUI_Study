//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/13/24.
//

import Foundation

@MainActor
final class ExploreViewModel: ObservableObject {
    @Published var listings: [Listing] = []
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy: [Listing] = []
       
    init(service: ExploreService) {
        self.service = service
        Task {
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        if searchLocation.isEmpty {
            return
        }
        let filteredListrings = listings.filter {
            $0.city.lowercased().contains(searchLocation.lowercased()) ||
            $0.state.lowercased().contains(searchLocation.lowercased())
        }
        self.listings = (filteredListrings.isEmpty ? listingsCopy : filteredListrings)
    }
}
