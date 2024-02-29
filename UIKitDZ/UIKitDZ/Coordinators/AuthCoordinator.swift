// AuthCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор авторизации
final class AuthCoordinator: BaseCoodinator {
    // MARK: - Types

    typealias VoidHandler = () -> (Void)

    // MARK: - Public Properties

    var onFinishFlow: VoidHandler?
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
