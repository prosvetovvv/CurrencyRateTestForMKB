//
//  RequestProviding.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 27.05.2021.
//

import Foundation

protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .rates:
            guard let url = URL(string: "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44") else {
                preconditionFailure("Invalid URL used to create URL instance")
            }
            
            guard let jsonData = try? JSONEncoder().encode(RequestExchangeRates()) else {
                preconditionFailure("Invalid URL used to create URL instance")
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)", forHTTPHeaderField: "User-Agent")
            request.httpBody = jsonData
            
            //return URLRequest(url: url)
            return request
        }
    }
}
