// AuthCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор авторизации
final class AuthCoordinator: BaseCoodinator {
    // MARK: - Public Properties
    var onFinishFlow: (() -> (Void))?
    var rootController: UINavigationController
    
    // MARK: - Private Properties
    
    let builder = AppBuilder()

    // MARK: - Initializers
    
    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    // MARK: - Public Methods

    func onFinish() {
        onFinishFlow?()
    }

}
