//
//  CRFlagImageView.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import UIKit

class CRFlagImageView: UIImageView {
    let placeholderImage = UIImage(systemName: "questionmark.square")
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setup() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
