//
//  SceneDelegate.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        let providerFactory = ProviderFactory()
        let rateProvider = providerFactory.makeRateProvider()
        
        let rateViewModel = RateViewModel(service: rateProvider)
        
        let mainTableVC = RateVC(viewModel: rateViewModel)
        
        window = UIWindow(frame: windowsScene.coordinateSpace.bounds)
        window?.windowScene = windowsScene
        
        window?.rootViewController = mainTableVC
        window?.makeKeyAndVisible()
    }
}

