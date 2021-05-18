//
//  CRErrors.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import Foundation

enum CRError: String, Error {
    case unableToComplete   = "Невозможно сделать запрос. Пожалуйста, проверьте соединение."
    case invalidResponse    = "Неправильный запрос. Пожалуйста, попробуйте еще."
    case invalidData        = "Получены некорректные данные от сервера. Пожалуйста, попробуйте еще."
}
