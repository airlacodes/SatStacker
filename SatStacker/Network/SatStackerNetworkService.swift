//
//  SatStackerNetworkService.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//  Copyright © 2020 Codeonomics. All rights reserved.
//

import Foundation
import Combine

struct SatStackerNetworkService: NetworkService {    
    func request<T>(with builder: NetworkRequestBuilder) -> AnyPublisher<T, NetworkError> where T: Decodable {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<T, NetworkError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                    
                    return Just(data)
                        .decode(type: T.self, decoder: decoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                    } else {
                        return Fail(error: NetworkError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: NetworkError.unknown)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
