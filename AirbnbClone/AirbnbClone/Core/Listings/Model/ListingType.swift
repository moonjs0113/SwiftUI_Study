//
//  ListingType.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import Foundation

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        
        switch stringValue {
        case "apartment":
            self = .apartment
        case "house":
            self = .house
        case "town_house":
            self = .townHouse
        case "villa":
            self = .villa
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid ListingType value")
        }
    }
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
