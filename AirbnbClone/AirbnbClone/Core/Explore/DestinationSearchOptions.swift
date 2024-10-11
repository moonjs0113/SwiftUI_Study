//
//  DestinationSearchOptions.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import Foundation

enum DestinationSearchOptions: CaseIterable {
    case location
    case dates
    case guests
    
    var title: String {
        switch self {
        case .location:
            return "Where"
        case .dates:
            return "When"
        case .guests:
            return "Who"
        }
    }
    
    var decription: String {
        switch self {
        case .location:
            return "Add destination"
        case .dates:
            return "Add dates"
        case .guests:
            return "Add guests"
        }
    }
    
    var height: CGFloat {
        switch self {
        case .location, .guests:
            return 120
        case .dates:
            return 180
        }
    }
}
