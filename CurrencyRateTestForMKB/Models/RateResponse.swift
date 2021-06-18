//
//   RateResponse.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 18.05.2021.
//

import Foundation

struct RateResponse: Codable {
    let code: Int
    let messageTitle, message, rid, downloadDate: String
    let rates: [RawRate]
    let productState: Int
    let ratesDate: String
}

struct RawRate: Codable {
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
