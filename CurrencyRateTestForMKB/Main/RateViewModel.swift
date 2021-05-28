//
//  MainViewModel.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 26.05.2021.
//

import Foundation

class RateViewModel {
    private let service: RateProviding
    private var rateResponse: RateResponse?
    public var rates = [FormattedRate]()
    public var onRateUpdate: () -> Void = {}
    
    // MARK: - Init
    
    init(service: RateProviding) {
        self.service = service
    }
    
    // MARK: - Public
    
    public func fetch() {
        service.getRate { result in
            
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {

                    //self.rates = response.rates
                    self.rates = self.formatRates(response.rates)
                    self.onRateUpdate()
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    // MARK: - Private
    
    private func formatRates(_ rates: [Rate]) -> [FormattedRate] {
        var result = [FormattedRate]()
        
        rates.forEach {
            let formattedRate = FormattedRate(with: $0)
            result.append(formattedRate)
        }
        
        return result
    }
}
