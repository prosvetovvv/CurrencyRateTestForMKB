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
    public var formattedRates = [FormattedRate]()
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
                    self.formattedRates = response.rates.map { FormattedRate(with: $0) }
                    self.onRateUpdate()
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
