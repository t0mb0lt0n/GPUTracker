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
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [MainViewController(), MainViewController()]
        window?.rootViewController = splitVC
        splitVC.preferredDisplayMode = .oneOverSecondary
        window?.rootViewController?.navigationItem.titleView?.tintColor = .systemGray
        window?.makeKeyAndVisible()
        return true
    }
}

