//
//  String+Ext.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 19.05.2021.
//

import Foundation

extension String {
    func convertToDouble() -> Double {
        (self as NSString).doubleValue
    }
}
