//
//  SceneDelegate.swift
//  Adaptive-UICollectionView-Demo
//
//  Created by Seb Vidal on 26/02/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let layout = UICollectionViewLayout.adaptiveLayout(for: windowScene.traitCollection)
        let viewController = AdaptiveCollectionViewController(collectionViewLayout: layout)
        viewController.title = "UICollectionView"
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
