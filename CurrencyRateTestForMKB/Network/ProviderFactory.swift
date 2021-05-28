//
//  ProviderFactory.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 27.05.2021.
//

import Foundation

struct ProviderFactory {
    let network = Network()
    
    func makeRateProvider() -> RateProviding {
        RateProvider(network: network)
    }
}
