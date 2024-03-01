// DishesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с DishesPresenter
protocol DishesPresenterProtocol {
    /// Просит презентера обновить UI кнопок сортировки по калориям
    func updateCaloriesControlUI()
    /// Просит презентера обновить UI кнопки сортировки по времени
    func updateTimeControlUI()
    /// Просит презентера обновить состояние кнопок сортировки
    func updateSortingViewState(sender: CustomControlView)
    /// Просит презентера вернуться на экран с категориями рецептов
    func moveToRecipes()
}

/// Presenter для страницы рецептов
class DishesPresenter {
    // MARK: - Private Properties

    private weak var view: DishesViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?

    // MARK: - Initializers

    init(view: DishesViewControllerProtocol, coordinator: RecipesCoordinator) {
        self.view = view
        recipesCoordinator = coordinator
    }
}

// MARK: - RecipesPresenter + RecipesPresenterProtocol

extension DishesPresenter: DishesPresenterProtocol {
    func updateTimeControlUI() {
        view?.updateTimeView()
    }

    func updateCaloriesControlUI() {
        view?.updateCaloriesView()
    }

    func updateSortingViewState(sender: CustomControlView) {
        view?.updateState(sender: sender)
    }

    func moveToRecipes() {
        recipesCoordinator?.pushRecipesView()
    }
}
