//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/13/24.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    @Published var listings: [Listing] = []
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        Task {
            await fetchListings()
        }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
