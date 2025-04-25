//
//  MovieCardType.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

enum MovieCardType {
    case poster, grid
}


extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.38
        case .grid:
            return 0.28
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.25
        case .grid:
            return 0.17
        }
    }
}
