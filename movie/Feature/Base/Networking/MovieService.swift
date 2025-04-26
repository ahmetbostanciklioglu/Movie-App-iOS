//
//  MovieService.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation


enum MovieServiceError: Error {
    case invalidResponse
    case invalidData
}


class MovieService {
     func fetchData<T: Decodable>(api: ApiConstructor, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let url = try DefaultUrlBuilder.build(api: api)
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    completion(.failure(MovieServiceError.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(MovieServiceError.invalidData))
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
}
