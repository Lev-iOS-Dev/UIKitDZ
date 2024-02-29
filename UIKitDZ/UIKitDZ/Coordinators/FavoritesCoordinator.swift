// FavoritesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор избранных
final class FavoritesCoordinator: BaseCoodinator {
    // MARK: - Types

    typealias VoidHandler = () -> (Void)

    var rootController: UINavigationController
    var onFinishFlow: VoidHandler?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }
}
