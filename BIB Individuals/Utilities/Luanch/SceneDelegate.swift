//
//  SceneDelegate.swift
//  BIB Individuals
//
//  Created by Tariq on 13/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }


}

