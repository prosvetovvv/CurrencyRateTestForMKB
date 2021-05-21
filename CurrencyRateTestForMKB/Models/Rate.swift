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

extension Rate {
    var country: String {
        String(currencyCodeTo.prefix(2))
    }
    var buyPriceFormatted: String {
        formatPrice(with: buy)
    }

    var salePriceFormatted: String {
        formatPrice(with: sale)
    }
}

extension Rate {

    private func formatPrice(with price: String) -> String {
        switch currencyCodeFrom {
        case .rur:
            let price = price.doubled()
            return String(format: "%.2f ₽", price)
            
        default:
            let price = NSNumber(value: price.doubled())
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .currency
            formatter.currencyCode = currencyCodeFrom.rawValue
            formatter.maximumFractionDigits = 2
            
            return formatter.string(from: price)!
        }
    }
}
