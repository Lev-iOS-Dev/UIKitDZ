// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с RecipePresenter
protocol RecipesPresenterProtocol {
    func fetchCategories() -> Categories
    func moveToDishes()
}

/// Presenter для страницы рецептов
class RecipesPresenter {
    // MARK: - Private Properties

    private weak var view: UIViewController?
    private weak var recipesCoordinator: RecipesCoordinator?
    private let categoriesStorage = CategoriesStorage()

    // MARK: - Initializers

    init(view: UIViewController, coordinator: RecipesCoordinator) {
        self.view = view
        recipesCoordinator = coordinator
    }
}

// MARK: - RecipesPresenter + RecipesPresenterProtocol

extension RecipesPresenter: RecipesPresenterProtocol {
    func fetchCategories() -> Categories {
        categoriesStorage.categories
    }

    func moveToDishes() {
        recipesCoordinator?.pushDishesView()
    }
}
