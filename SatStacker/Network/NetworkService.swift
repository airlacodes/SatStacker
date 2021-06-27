//
//  APIService.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T: Decodable>(with builder: NetworkRequestBuilder) -> AnyPublisher<T, NetworkError>
}
