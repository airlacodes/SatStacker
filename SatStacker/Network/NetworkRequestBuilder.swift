//
//  NetworkRequestBuilder.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//  Copyright © 2020 Codeonomics. All rights reserved.
//

import Foundation

protocol NetworkRequestBuilder {
    var urlRequest: URLRequest {get}
}
