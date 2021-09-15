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
        start(window: window!)
    }

    func start(window: UIWindow){
        var vc = UIViewController()
        if Helper.getUserData().email == "" || Helper.getUserData().email == nil{
            vc = LoginVC()
        }else{
            vc = HomeVC()
        }
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

