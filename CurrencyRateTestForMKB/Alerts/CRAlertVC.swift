//
//  GBAlertVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 12.05.2021.
//

import UIKit

class CRAlertVC: UIViewController {
    var rootView: CRAlertView
    
    // MARK: - Init
    
    init(title: String, message: String, buttonTitle: String) {
        rootView = CRAlertView(title: title, message: message, buttonTitle: buttonTitle)
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
        setupActionButton()
    }
    
    // MARK: - Private
    
    private func setupActionButton() {
        rootView.actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    // MARK: - Objc
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
