//
//  RateCell.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 18.05.2021.
//

import UIKit

class RateCell: UITableViewCell {
    static let reuseID = "RateCell"
    private let flagImageView = CRFlagImageView(frame: .zero)
    private let nameCurrencyLabel = CRTitleLabel(textAlignment: .left, fontSize: 19, numberOfLines: 2)
    private let codeCurrencyLabel = CRSecondaryTitleLabel(textAlignment: .left, fontSize: 15)
    private let buyPriceLabel = CRTitleLabel(textAlignment: .right, fontSize: 20, numberOfLines: 1)
    private let deltaBuyLabel = CRSecondaryTitleLabel(textAlignment: .left, fontSize: 15)
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    public func set(with rate: Rate) {
        let deltaBuy = rate.deltaBuy.doubled()
        
        flagImageView.image = UIImage(named: rate.country) ?? UIImage(systemName: "questionmark.square")
        
        nameCurrencyLabel.text = rate.name
        codeCurrencyLabel.text = rate.currencyCodeTo
        
        buyPriceLabel.text = rate.buyPriceFormatted
        
        deltaBuyLabel.textColor = deltaBuy > 0 ? .systemPink : .systemGreen
        deltaBuyLabel.text = deltaBuy > 0 ? "+\(deltaBuy)" : "\(deltaBuy)"
    }
    
    // MARK: - Private
    
    private func setupSelf() {
        selectionStyle = .none
        
        addSubview(flagImageView)
        addSubview(nameCurrencyLabel)
        addSubview(codeCurrencyLabel)
        addSubview(buyPriceLabel)
        addSubview(deltaBuyLabel)
        
        setNeedsUpdateConstraints()
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            flagImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            flagImageView.widthAnchor.constraint(equalToConstant: 100),
            flagImageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameCurrencyLabel.topAnchor.constraint(equalTo: flagImageView.topAnchor),
            nameCurrencyLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
            nameCurrencyLabel.widthAnchor.constraint(equalToConstant: 180),
            nameCurrencyLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            
            codeCurrencyLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: padding),
            codeCurrencyLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
            
            buyPriceLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -4),
            buyPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            buyPriceLabel.widthAnchor.constraint(equalToConstant: 75),
            
            deltaBuyLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: padding),
            deltaBuyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
        ])
    }
}
