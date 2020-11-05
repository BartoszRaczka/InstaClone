//
//  SceneDelegate.swift
//  InstaClone
//
//  Created by MacBook on 05/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let firstWindow = UIWindow(windowScene: windowScene)
        window = firstWindow
        
        coordinator = AppCoordinator(with: firstWindow)
        coordinator?.start()
    }

}

