//
//  RateVC+Ext.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 18.06.2021.
//

import Foundation
import UIKit

extension RateVC: ShowingLoadingSpinner {
    var spinnerView: LoadingSpinnerView {
        LoadingSpinnerView(frame: UIScreen.main.bounds)
    }
    
    func showSpinnerView() {
        view.addSubview(spinnerView)
    }
    
    func dismissSpinnerView() {
        let spinnerView = view.subviews.filter{$0 is LoadingSpinnerView}
        spinnerView.forEach{ spinner in
            spinner.removeFromSuperview()
        }
    }
}
