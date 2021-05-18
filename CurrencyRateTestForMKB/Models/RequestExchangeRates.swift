//
//  RequestExchangeRates.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 18.05.2021.
//

import Foundation

struct RequestExchangeRates: Codable {
    let uid: String
    let type: String
    let rid: String
}

extension RequestExchangeRates {
    init() {
        uid = "563B4852-6D4B-49D6-A86E-B273DD520FD2"
        type = "ExchangeRates"
        rid = "BEYkZbmV"
    }
}
