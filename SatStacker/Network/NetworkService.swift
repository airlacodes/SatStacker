//
//  NetworkService.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//  Copyright © 2020 Codeonomics. All rights reserved.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T: Decodable>(with builder: NetworkRequestBuilder) -> AnyPublisher<T, NetworkError>
}
