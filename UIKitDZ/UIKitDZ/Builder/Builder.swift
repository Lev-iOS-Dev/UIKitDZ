// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контейнер для проставления зависимостей и сборки модулей
final class AppBuilder {
    // MARK: - Constants

    enum Constants {
        enum Images {
            static let recipes = "Recipes"
            static let favorites = "Favorites"
            static let profile = "Profile"
        }

        enum Titles {
            static let recipes = "Recipes"
            static let favorites = "Favorites"
            static let profile = "Profile"
        }
    }

    // MARK: - Public Methodes

    func makeAuthModule() -> AuthViewController {
        let view = AuthViewController()
        let authPresenter = AuthPresenter(view: view)
        view.presenter = authPresenter
        return view
    }

    func makeRecipesModule() -> RecipesViewController {
        let view = RecipesViewController()
        let recipesPresenter = RecipePresenter(view: view)
        view.presenter = recipesPresenter
        view.tabBarItem = UITabBarItem(
            title: Constants.Titles.recipes,
            image: UIImage(named: Constants.Images.recipes),
            tag: 0
        )
        return view
    }

    func makeFavoritesModule() -> FavoritesViewController {
        let view = FavoritesViewController()
        let favoritesPresenter = FavoritesPresenter(view: view)
        view.presenter = favoritesPresenter
        view.tabBarItem = UITabBarItem(
            title: Constants.Titles.favorites,
            image: UIImage(named: Constants.Images.favorites),
            tag: 1
        )
        return view
    }

    func makeProfileModule() -> ProfileViewController {
        let view = ProfileViewController()
        let profilePresenter = ProfilePresenter(view: view)
        view.presenter = profilePresenter
        view.tabBarItem = UITabBarItem(
            title: Constants.Titles.profile,
            image: UIImage(named: Constants.Images.profile),
            tag: 2
        )
        return view
    }

    func makeBonusesModule(coordinator: BaseCoodinator) -> BonusViewController {
        let view = BonusViewController()
        let bonusesPresenter = BonusPresenter(view: view, coordinator: coordinator)
        view.presenter = bonusesPresenter
        return view
    }

    func makeTermsOfUseModule(coordinator: BaseCoodinator) -> TermsOfUseViewController {
        let view = TermsOfUseViewController()
        let bonusesPresenter = TermsOfUsePresenter(view: view, coordinator: coordinator)
        view.presenter = bonusesPresenter
        return view
    }
}
