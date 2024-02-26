// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SceneDelegate class
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        setupWindow(scene)
    }

    private func setupWindow(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let rootVC = TabBarController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
}
