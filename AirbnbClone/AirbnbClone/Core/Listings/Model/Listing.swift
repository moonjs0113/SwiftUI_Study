//
//  Listing.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import Foundation

struct Listing: Identifiable, Codable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let stat: String
    let title: String
    var rating: Double
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
}

extension Listing {
    static let mockData: [Self] = {
        guard let fileURL = Bundle.main.url(forResource: "Listing_Mock", withExtension: "json") else {
            print("fileURL")
            return []
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            print("data")
            return []
        }
        print("Print")
        return (try? JSONDecoder().decode([Listing].self, from: data)) ?? []
    }()
}






