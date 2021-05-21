//
//  DetailView.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 20.05.2021.
//

import UIKit

class DetailView: UIView {
    private let rate: Rate
    private let containerView = UIView()
    private let flagImageView = UIImageView()
    private let nameTitleLabel = CRTitleLabel(textAlignment: .center, fontSize: 25, numberOfLines: 2)
    private let buyStackView = CRPriceStackView()
    private let saleStackView = CRPriceStackView()
    let dismissButton = UIButton(type: .close)
    
    // MARK: - Init
    
    init(rate: Rate) {
        self.rate = rate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setup() {
        applyBlurEffect()
        
        setupContainerView()
        setupFlagImageView()
        setupDismissButton()
        setupNameTitle()
        setupBuyStackView()
        setupSaleStackView()
        
        setNeedsUpdateConstraints()
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
    }
    
    private func setupDismissButton() {
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(dismissButton)
    }
    
    private func setupFlagImageView() {
        flagImageView.image = UIImage(named: rate.country)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(flagImageView)
    }
    
    private func setupNameTitle() {
        nameTitleLabel.text = rate.name
        
        containerView.addSubview(nameTitleLabel)
    }
    
    private func setupBuyStackView() {
        buyStackView.set(title: "Продажа", price: rate.buyPriceFormatted, delta: rate.deltaBuy.doubled())
        
        containerView.addSubview(buyStackView)
    }
    
    private func setupSaleStackView() {
        saleStackView.set(title: "Покупка", price: rate.salePriceFormatted, delta: rate.deltaSale.doubled())
        
        containerView.addSubview(saleStackView)
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 250),
            containerView.bottomAnchor.constraint(equalTo: buyStackView.bottomAnchor, constant: 15),
            
            dismissButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            
            flagImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            flagImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            flagImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            flagImageView.heightAnchor.constraint(equalToConstant: 180),
            
            nameTitleLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 5),
            nameTitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nameTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2 * padding),
            nameTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2 * padding),
            
            buyStackView.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 10),
            buyStackView.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            
            saleStackView.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 10),
            saleStackView.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: padding)
        ])
    }
}
