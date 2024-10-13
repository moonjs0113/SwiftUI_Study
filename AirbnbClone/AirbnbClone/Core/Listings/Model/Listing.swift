//
//  Listing.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let imageURLs: [String]
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
}

extension Listing {
    static let mockData: [Self] = {
        guard let fileURL = Bundle.main.url(forResource: "Listing_Mock", withExtension: "json") else {
            return []
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            return []
        }
        return (try? JSONDecoder().decode([Listing].self, from: data)) ?? []
    }()
}






