//
//  BinanceAPI.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//

import Foundation
import Combine

struct BINANCE_CONST {
    static let root = "https://api.binance.com"
    
    static let tickerPrice = root + "/api/v3/ticker/price"
    static let accountSnapshot = root + "/sapi/v1/accountSnapshot"
}

protocol BinanceService {
    var apiService: NetworkService { get }
    
    func tickerPrice(ticker: String) -> AnyPublisher<TickerPrice, NetworkError>
}

extension BinanceService {
    
    func tickerPrice(ticker: String) -> AnyPublisher<TickerPrice, NetworkError> {
        return apiService.request(with: BinanceEndpoint.tickerPrice(ticker: ticker)).eraseToAnyPublisher()
    }
    
    func accountSnapshot() -> AnyPublisher<AccountSnapshotResponse, NetworkError> {
        return apiService.request(with: BinanceEndpoint.accountSnapshot)
    }
}
