//
//  BinanceEndpoint.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//

import Foundation

enum BinanceEndpoint {
    case tickerPrice(ticker: String)
    case accountSnapshot
}

extension BinanceEndpoint: NetworkRequestBuilder {
    
    var urlRequest: URLRequest {
        
        switch self {
        case .tickerPrice(let ticker):
            guard let url = URL(string: BINANCE_CONST.tickerPrice + "?symbol=\(ticker)") else {
                preconditionFailure("INVALID URL: \(self)")
            }
            
            return URLRequest(url: url)
        
        case .accountSnapshot:
            guard let url = URL(string: BINANCE_CONST.accountSnapshot) else {
                preconditionFailure("INVALID URL: \(self)")
            }
            
            return URLRequest(url: url)
        }
    }
}

