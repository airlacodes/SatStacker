//
//  AppHeader.swift
//  SatStacker
//
//  Created by Codeonomics on 26/06/2021.
//

import Foundation
import SwiftUI

struct AppHeader: View {
    
    @ObservedObject var bitcoinPriceViewModel = BitcoinPriceVM()
    
    var body: some View {

        HStack {
            Text("Sat Stacker")
                .padding(EdgeInsets(top: 0,
                                    leading: 5,
                                    bottom: 5,
                                    trailing: 30))
                .font(.largeTitle)
            Spacer().frame(width: 500)
            HStack {
                Text("1 BTC = \(bitcoinPriceViewModel.price?.displayPrice ?? "")").font(.title2)
                Text("1 Satoshi = £0.00023").font(.headline)
                Button("refresh") {
                    bitcoinPriceViewModel.load()
                }
            }
        }
        
        .onAppear {
            bitcoinPriceViewModel.load()
        }
    }
}
