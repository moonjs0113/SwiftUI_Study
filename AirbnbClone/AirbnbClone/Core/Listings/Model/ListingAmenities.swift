//
//  ListingAmenities.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import Foundation

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        
        switch stringValue {
        case "pool":
            self = .pool
        case "kitchen":
            self = .kitchen
        case "wifi":
            self = .wifi
        case "laundry":
            self = .laundry
        case "tv":
            self = .tv
        case "alarm_system":
            self = .alarmSystem
        case "office":
            self = .office
        case "balcony":
            self = .balcony
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid ListingAmenities value")
        }
    }
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    var id: Int { return self.rawValue }
}
