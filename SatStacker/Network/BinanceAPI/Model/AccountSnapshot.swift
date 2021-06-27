//
//  Portfolio.swift
//  SatStacker
//
//  Created by Codeonomics on 27/06/2021.
//

import Foundation


struct AccountSnapshotResponse: Codable {
    let code: String
    let msg: String
    let snapshotVos: Snapshot
}

struct Snapshot: Codable {
    let data: Portfolio
    let type: String
    let updateTime: UInt64
}

struct Portfolio: Codable {
    let balances: [Balance]
    let totalAssetOfBtc: String
}

struct Balance: Codable {
    let asset: String
    let free: String
    let locked: String
}
