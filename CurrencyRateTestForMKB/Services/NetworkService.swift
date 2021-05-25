//
//  NetworkService.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private let url = "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44"
    
    private init() {}
    
    func getExchangeRates(completion: @escaping (Result<[Rate], CRError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.unableToComplete))
            return
        }
        
        guard let jsonData = try? JSONEncoder().encode(RequestExchangeRates()) else {
            completion(.failure(.unableToComplete))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)", forHTTPHeaderField: "User-Agent")
        request.httpBody = jsonData
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(RateResponse.self, from: data)
                completion(.success(response.rates))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
    
