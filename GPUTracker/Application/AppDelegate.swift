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
        splitVC.delegate = self
        splitVC.preferredPrimaryColumnWidthFraction = 50
        //splitVC.maximumPrimaryColumnWidth = 2000
       // splitVC.editButtonItem
        splitVC.preferredDisplayMode = UISplitViewController.DisplayMode.allVisible
        splitVC.minimumPrimaryColumnWidth = .greatestFiniteMagnitude
        let navVC1 = UINavigationController(rootViewController: MainViewController())
        let navVC2 = UINavigationController(rootViewController: ItemListViewController())
        splitVC.viewControllers = [navVC1, navVC2]
        window?.rootViewController = splitVC
        splitVC.preferredDisplayMode = .oneOverSecondary
        window?.rootViewController?.navigationItem.titleView?.tintColor = .systemGray
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    

}

