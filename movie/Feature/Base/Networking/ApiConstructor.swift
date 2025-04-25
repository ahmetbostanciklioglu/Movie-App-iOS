//
//  ApiConstructor.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

typealias Parameters = [String: String]

struct ApiConstructor {
    let endpoint: Endpoint
    var params: Parameters = [:]
}
