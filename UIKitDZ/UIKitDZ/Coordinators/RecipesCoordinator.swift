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

    func pushDishesView(data: Category) {
        let dishesView = builder.makeDishesModule(
            coordinator: self,
            data: data
        )
        dishesView.hidesBottomBarWhenPushed = true
        rootController?.pushViewController(dishesView, animated: true)
    }

    func pushDishesDetailView(data: Dish) {
        let dishesDetailView = builder.makeDishesDetailModule(
            coordinator: self,
            data: data
        )
        dishesDetailView.hidesBottomBarWhenPushed = true
        rootController?.pushViewController(dishesDetailView, animated: true)
    }

    func returnToRecipes() {
        rootController?.popViewController(animated: true)
    }

    func returnToDishes() {
        rootController?.popViewController(animated: true)
    }

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }
}
