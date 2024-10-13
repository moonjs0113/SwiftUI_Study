//
//  ListingFeatures.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import Foundation

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        
        switch stringValue {
        case "self_check_in":
            self = .selfCheckIn
        case "super_host":
            self = .superHost
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid ListingFeatures value")
        }
    }
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    var title: String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad."
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are commited to providing greate stars for guests."
        }
    }
    
    var id: Int { return self.rawValue }
}
