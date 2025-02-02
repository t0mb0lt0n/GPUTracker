//
//  AppDelegate.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        
        let mainVC = MainCatalogueViewController()
        let mainNavVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = mainNavVC
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        return true
    }
}
