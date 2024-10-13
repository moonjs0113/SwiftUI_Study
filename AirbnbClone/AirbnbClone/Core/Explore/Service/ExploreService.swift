//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/13/24.
//

import Foundation

final class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return Listing.mockData
    }
}
