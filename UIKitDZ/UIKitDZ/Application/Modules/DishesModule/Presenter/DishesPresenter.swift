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
    /// Просит презентера перейти на экран деталей про блюдо
    func moveToDishesDetail(data: Dish)
    /// Просит презентера получить данные о категории
    func fetchCategory()
}

/// Presenter для страницы рецептов
final class DishesPresenter {
    // MARK: - Private Properties

    private weak var view: DishesViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    private var data: Category

    // MARK: - Initializers

    init(
        view: DishesViewControllerProtocol,

        coordinator: RecipesCoordinator,
        data: Category
    ) {
        self.view = view
        recipesCoordinator = coordinator
        self.data = data
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

    func moveToDishesDetail(data: Dish) {
        recipesCoordinator?.pushDishesDetailView(data: data)
    }

    func fetchCategory() {
        view?.getCategory(data)
    }
}
