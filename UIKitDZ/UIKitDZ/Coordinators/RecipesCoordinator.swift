// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор рецептов
final class RecipesCoordinator: BaseCoodinator {
    // MARK: - Private Properties

    private let builder = AppBuilder()

    // MARK: - Public Properties

    var rootController: UINavigationController?
    var onFinishFlow: VoidHandler?

    // MARK: - Public Methods

    func pushDishesView() {
        let dishesView = builder.makeDishesModule(coordinator: self)
        rootController?.pushViewController(dishesView, animated: true)
    }

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }
}
