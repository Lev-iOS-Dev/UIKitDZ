// DishesDetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для общения с DishesDetailPresenter
protocol DishesDetailPresenterProtocol {
    /// просит презентера получить данные о блюде
    func fetchDish()
    /// Просит презентера вернуться на экран с категориями рецептов
    func moveToDishes()
    /// Просит презентера показать алерт
    func showAlert()
    /// Просит презентера показать активити контроллер
    func showActivityController()
}

/// Presenter для страницы рецептов
final class DishesDetailPresenter {
    // MARK: - Private Properties

    private weak var view: DishesDetailViewControllerProtocol?
    private weak var recipesCoordinator: RecipesCoordinator?
    private var data: Dish

    // MARK: - Initializers

    init(
        view: DishesDetailViewControllerProtocol,
        coordinator: RecipesCoordinator,
        data: Dish
    ) {
        self.view = view
        recipesCoordinator = coordinator
        self.data = data
    }
}

// MARK: - DishesDetailPresenter + DishesDetailPresenterProtocol

extension DishesDetailPresenter: DishesDetailPresenterProtocol {
    func fetchDish() {
        view?.updateData(data)
    }

    func moveToDishes() {
        recipesCoordinator?.returnToDishes()
    }

    func showAlert() {
        view?.showAlert()
    }

    func showActivityController() {
        view?.showActivityController()
    }
}
