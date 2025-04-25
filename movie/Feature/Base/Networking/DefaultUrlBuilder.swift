//
//  DefaultUrlBuilder.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

enum DefaultUrlBuilderError: Error {
    case invalidPath, invalidUrl
}


enum DefaultUrlBuilder {
    static func build(api: ApiConstructor) throws -> URL {
        guard var urlComponents = URLComponents(string: api.endpoint.fullPath) else {
            throw DefaultUrlBuilderError.invalidPath
        }
        
        urlComponents.queryItems = buildQeryParams(api.params, ["api_key": Constants.apiKey])
        
        guard let url = urlComponents.url else {
            throw DefaultUrlBuilderError.invalidUrl
        }
        
        return url
    }
    
    static func buildQeryParams(_ params: Parameters...) -> [URLQueryItem] {
        params.flatMap { $0 }.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
