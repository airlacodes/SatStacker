//
//  APIError.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//  Copyright © 2021 Codeonomics. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

