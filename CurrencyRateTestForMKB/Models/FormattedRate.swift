//
//  FormattedRate.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 25.05.2021.
//

import Foundation

protocol FormattedRateProtocol {
    var currencyName: String { get set }
    var country: String { get set }
    var currencyCode: String { get set }
    var buyPrice: String { get set }
    var salePrice: String { get set }
    var deltaBuy: Double { get set }
    var deltaSale: Double { get set }
    
    func getCountryCode(from currencyCode: String) -> String
    func formatPrice(input: String, currency: CurrencyCodes) -> String
}

struct FormattedRate: FormattedRateProtocol {
    var currencyName = ""
    var country = ""
    var currencyCode = ""
    var buyPrice = ""
    var salePrice = ""
    var deltaBuy: Double = 0
    var deltaSale: Double = 0
    
    func getCountryCode(from currencyCode: String) -> String {
        String(currencyCode.prefix(2))
    }
    
    func formatPrice(input: String, currency: CurrencyCodes) -> String {
        let price = NSNumber (value: (input as NSString).doubleValue)
        
        let formatter = NumberFormatter()
        formatter.currencyGroupingSeparator = " "
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .down
        formatter.numberStyle = .currency
        
        switch currency {
        case .rur:
            formatter.currencySymbol = "₽"
            
            return formatter.string(from: price) ?? "0.00"
            
        default:
            formatter.currencyCode = currency.rawValue
            
            return formatter.string(from: price) ?? "0"
        }
    }
}

extension FormattedRate {
    init(with rate: Rate) {
        self.currencyName = rate.name
        self.country = getCountryCode(from: rate.currencyCodeTo)
        self.currencyCode = rate.currencyCodeTo
        self.buyPrice = formatPrice(input: rate.buy, currency: rate.currencyCodeFrom)
        self.salePrice = formatPrice(input: rate.sale, currency: rate.currencyCodeFrom)
        self.deltaBuy = rate.deltaBuy.convertToDouble()
        self.deltaSale = rate.deltaSale.convertToDouble()
    }
}

