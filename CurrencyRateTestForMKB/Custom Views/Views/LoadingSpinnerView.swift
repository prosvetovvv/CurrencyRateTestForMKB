//
//  DataLoadingView.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.06.2021.
//

import UIKit

class LoadingSpinnerView: UIView {
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
        setupActivityIndicator()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupSelf() {
        backgroundColor = .systemBackground
        alpha = 0
        
        UIView.animate(withDuration: 0.25) { self.alpha = 0.8 }
    }
    
    private func setupActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.startAnimating()
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
