//
//  File.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 12.05.2021.
//

import UIKit

extension UIViewController {
    
    func presentGBAlertOnMainThread(title: String, message: String, buttonTitle: String, completionHandler: (() -> Void)?) {
        DispatchQueue.main.async {
            let alertVC = CRAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
