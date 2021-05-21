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
    let rates: [Rate]
    let productState: Int
    let ratesDate: String
}
