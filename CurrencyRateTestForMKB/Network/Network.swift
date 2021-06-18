//
//  Network.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 27.05.2021.
//

import Foundation

struct Network: Networking { }

struct RateProvider: RateProviding {
    var network: Networking
}


