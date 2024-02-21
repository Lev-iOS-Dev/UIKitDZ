// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let firstVC = NewsLineViewController()
        let secondVC = NotificationsViewController()
        let thirdVC = ProfileViewController()

        firstVC.tabBarItem = UITabBarItem(
            title: "Лента",
            image: UIImage(named: "newslineIcon"),
            tag: 0
        )
        secondVC.tabBarItem = UITabBarItem(
            title: "Уведомления",
            image: UIImage(named: "notificationIcon"),
            tag: 1
        )
        thirdVC.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profileIcon"),
            tag: 2
        )

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstVC, secondVC, thirdVC]
        tabBarController.tabBar.backgroundColor = .white

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}
