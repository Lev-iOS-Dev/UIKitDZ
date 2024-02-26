// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General app's tabBarController
final class TabBarController: UITabBarController {
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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        let recipesNavVC = UINavigationController(rootViewController: RecipesViewController())
        let recipesItem = UITabBarItem(
            title: Constants.Titles.recipes,
            image: UIImage(named: Constants.Images.recipes),
            tag: 0
        )
        recipesNavVC.tabBarItem = recipesItem

        let favoritesNavVC = UINavigationController(rootViewController: FavoritesViewController())
        let favoritesItem = UITabBarItem(
            title: Constants.Titles.favorites,
            image: UIImage(named: Constants.Images.favorites),
            tag: 1
        )
        favoritesNavVC.tabBarItem = favoritesItem

        let profileNavVC = UINavigationController(rootViewController: ProfileViewController())
        let profileItem = UITabBarItem(
            title: Constants.Titles.profile,
            image: UIImage(named: Constants.Images.profile),
            tag: 2
        )
        profileNavVC.tabBarItem = profileItem

        viewControllers = [recipesNavVC, favoritesNavVC, profileNavVC]
        view.backgroundColor = .systemBackground
        view.tintColor = .tabBarTint
    }
}
