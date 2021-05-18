//
//  Rate.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import Foundation

struct Rate: Codable {
    let tp: Int
    let name: String
    let from: Int
    let currMnemFrom: CurrMnemFrom
    let to: Int
    let currMnemTo, basic, buy, sale: String
    let deltaBuy, deltaSale: String
}

enum CurrMnemFrom: String, Codable {
    case eur = "EUR"
    case gbp = "GBP"
    case rur = "RUR"
    case usd = "USD"
}
