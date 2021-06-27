//
//  TickerPrice.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//

import Foundation

struct TickerPrice: Codable {
    let symbol: String
    let price: String
    
    var displayPrice: String {
        return "£\(price)"
    }
    
}
