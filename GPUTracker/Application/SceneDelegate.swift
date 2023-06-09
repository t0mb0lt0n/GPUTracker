//
//  SceneDelegate.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //Make main window Scene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let mainNavController = UINavigationController(rootViewController: MainViewController())
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = mainNavController
        window?.makeKeyAndVisible()
    }
}

