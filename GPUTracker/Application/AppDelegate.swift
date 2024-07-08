//
//  AppDelegate.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow()
        
        let splitVC = UISplitViewController()
        let detailsVC = ItemDetailsViewController(
            viewModel: .init(forItemWithRealmName: .xbox360Realm)
        )
        let mainVC = MainViewController()
        splitVC.minimumPrimaryColumnWidth = .greatestFiniteMagnitude
        let mainNavVC = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = mainNavVC
        splitVC.preferredDisplayMode = .oneOverSecondary
        window?.makeKeyAndVisible()
        return true
    }
}

