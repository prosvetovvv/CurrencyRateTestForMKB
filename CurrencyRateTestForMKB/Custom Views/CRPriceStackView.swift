//
//  CRPriceStackView.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 20.05.2021.
//

import UIKit

class CRPriceStackView: UIStackView {
    private let titleLabel = CRSecondaryTitleLabel(textAlignment: .center, fontSize: 18)
    private let priceLabel = CRSecondaryTitleLabel(textAlignment: .center, fontSize: 16)
    private let deltaLabel = CRSecondaryTitleLabel(textAlignment: .center, fontSize: 14)
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func set(title: String, price: String, delta: Double) {
        titleLabel.text = title
        priceLabel.text = price
        deltaLabel.textColor = delta > 0 ? .systemPink : .systemGreen
        deltaLabel.text = delta > 0 ? "+\(delta)" : "\(delta)"
    }
    
    // MARK: - Private
    
    private func setup() {
        backgroundColor = .systemBackground
        axis = .vertical
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(titleLabel)
        setCustomSpacing(10, after: titleLabel)
        addArrangedSubview(priceLabel)
        setCustomSpacing(4, after: priceLabel)
        addArrangedSubview(deltaLabel)
    }
}
