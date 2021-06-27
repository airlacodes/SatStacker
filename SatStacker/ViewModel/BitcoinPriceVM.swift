//
//  BitcoinPriceModel.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//

import Foundation
import Combine

class BitcoinPriceVM: ObservableObject, BinanceService {
    
    var apiService: NetworkService
    @Published var price: TickerPrice?
    
    var cancellables = Set<AnyCancellable>()

    init(apiService: NetworkService = SatStackerNetworkService()) {
        self.apiService = apiService
    }
    
    func load() {
        let cancellable = self.tickerPrice(ticker: "BTCGBP")
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (result) in
                self.price = result
        }
        
        cancellables.insert(cancellable)
    }
    
}
