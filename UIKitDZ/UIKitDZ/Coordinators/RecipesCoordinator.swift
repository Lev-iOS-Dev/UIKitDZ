// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор рецептов
final class RecipesCoordinator: BaseCoodinator {
    // MARK: - Types

    typealias VoidHandler = () -> (Void)

    var rootController: UINavigationController
    var onFinishFlow: VoidHandler?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }
}
