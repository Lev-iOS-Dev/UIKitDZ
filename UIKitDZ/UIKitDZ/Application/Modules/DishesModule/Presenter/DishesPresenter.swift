// DishesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с DishesPresenter
protocol DishesPresenterProtocol {}

/// Presenter для страницы рецептов
class DishesPresenter {
    // MARK: - Private Properties

    private weak var view: UIViewController?
    private weak var recipesCoordinator: RecipesCoordinator?

    // MARK: - Initializers

    init(view: UIViewController, coordinator: RecipesCoordinator) {
        self.view = view
        recipesCoordinator = coordinator
    }
}

// MARK: - RecipesPresenter + RecipesPresenterProtocol

extension DishesPresenter: DishesPresenterProtocol {}
