// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с RecipePresenter
protocol RecipesPresenterProtocol {
    /// для получения данных о категориях
    func fetchCategories()
    /// переход на страницу блюд
    func moveToDishes(data: Category)
}

/// Presenter для страницы рецептов
final class RecipesPresenter {
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

    func moveToDishes(data: Category) {
        recipesCoordinator?.pushDishesView(data: data)
    }
}
