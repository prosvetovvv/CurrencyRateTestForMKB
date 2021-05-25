//
//  DetailVC.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 20.05.2021.
//

import UIKit

class DetailVC: UIViewController {
    private let rootView: DetailView
    
    // MARK: - Init
    
    init(rate: FormattedRate) {
        self.rootView = DetailView(rate: rate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissButton()
    }
    
    // MARK: - Private
    
    private func setupDismissButton() {
        rootView.dismissButton.addTarget(self, action: #selector(tappedDismiss), for: .touchUpInside)
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedDismiss() {
        dismiss(animated: true)
    }
}
