// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с RecipePresenter
protocol RecipesPresenterProtocol {
    ///
    func fetchCategories()
    ///
    func moveToDishes(data: [Dish])
}

/// Presenter для страницы рецептов
class RecipesPresenter {
    // MARK: - Private Properties

    private weak var view: RecipesViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    private var categoriesStorage = CategoriesStorage()

    // MARK: - Initializers

    init(view: RecipesViewControllerProtocol, coordinator: RecipesCoordinator) {
        self.view = view
        recipesCoordinator = coordinator
    }
}

// MARK: - RecipesPresenter + RecipesPresenterProtocol

extension RecipesPresenter: RecipesPresenterProtocol {
    func fetchCategories() {
        let categories = categoriesStorage.categories
        view?.updateData(categories)
    }

    func moveToDishes(data: [Dish]) {
        recipesCoordinator?.pushDishesView(data: data)
    }
}
