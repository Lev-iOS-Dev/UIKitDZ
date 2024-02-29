// FavoritesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных
final class FavoritesCoordinator: BaseCoodinator {
    var rootController: UINavigationController
    var onFinishFlow: (() -> (Void))?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }
}
