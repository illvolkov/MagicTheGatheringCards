//
//  AppDelegate.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = UINavigationController(rootViewController: CardController())
                
        return true
    }


}

