//
//  Rate.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import Foundation

struct Rate: Codable {
    let tp, from, to: Int
    let currencyCodeTo: String
    let currencyCodeFrom: CurrencyCodes
    let name, basic, buy, sale: String
    let deltaBuy, deltaSale: String
    
    enum CodingKeys: String, CodingKey {
        case tp, name, from, to, basic, buy, sale, deltaBuy, deltaSale
        case currencyCodeFrom = "currMnemFrom"
        case currencyCodeTo = "currMnemTo"
    }
}

enum CurrencyCodes: String, Codable {
    case eur = "EUR"
    case gbp = "GBP"
    case rur = "RUR"
    case usd = "USD"
}
