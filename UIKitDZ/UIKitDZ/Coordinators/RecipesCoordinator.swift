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

    func pushDishesView(data: [Dish]) {
        let dishesView = builder.makeDishesModule(
            coordinator: self,
            data: data
        )
        dishesView.hidesBottomBarWhenPushed = true
        rootController?.pushViewController(dishesView, animated: true)
    }

    func pushRecipesView() {
        rootController?.popViewController(animated: true)
    }

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }
}
