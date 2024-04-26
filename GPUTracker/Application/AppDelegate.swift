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
        let mainVC = MainViewController(with: detailsVC)
        detailsVC.mainVC = mainVC
        splitVC.preferredDisplayMode = UISplitViewController.DisplayMode.allVisible
        splitVC.minimumPrimaryColumnWidth = .greatestFiniteMagnitude
        let navVC1 = UINavigationController(rootViewController: mainVC)
        let navVC2 = UINavigationController(rootViewController: detailsVC)
        splitVC.viewControllers = [navVC1, navVC2]
        window?.rootViewController = splitVC
        splitVC.preferredDisplayMode = .oneOverSecondary
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        true
    }
}

