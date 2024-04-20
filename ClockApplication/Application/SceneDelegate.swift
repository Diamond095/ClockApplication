//
//  SceneDelegate.swift
//  MyProject
//
//  Created by Ivan Basov on 26.03.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let tabBarController = TabBarController()
        guard let windowScene=(scene as? UIWindowScene) else{ return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene=windowScene;
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    

}

