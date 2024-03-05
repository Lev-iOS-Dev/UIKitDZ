// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор главный
final class AppCoordinator: BaseCoodinator {
    // MARK: - Private Properties

    private var tabBarViewController: TabBarController?
    private var appBuilder = AppBuilder()

    // MARK: - Private Methods

    override func start() {
        if "admin" == "admin" {
            goToMain()
        } else {
            goT​oAuth​()
        }
    }

    private func goToMain() {
        tabBarViewController = TabBarController()
        /// Set Recipes
        let recipesCoordinator = RecipesCoordinator()
        let recipesModuleView = appBuilder.makeRecipesModule(coordinator: recipesCoordinator)
        recipesCoordinator.setViewController(controller: recipesModuleView)
        add(coordinator: recipesCoordinator)

        /// Set Favorites
        let favoritesCoordinator = FavoritesCoordinator()
        let favoritesModuleView = appBuilder.makeFavoritesModule(coordinator: favoritesCoordinator)
        favoritesCoordinator.setViewController(controller: favoritesModuleView)
        add(coordinator: favoritesCoordinator)

        /// Set Profile
        let profileCoordinator = ProfileCoordinator()
        let profileModuleView = appBuilder.makeProfileModule(coordinator: profileCoordinator)
        profileCoordinator.setViewController(controller: profileModuleView)
        add(coordinator: profileCoordinator)

        profileCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: recipesCoordinator)
            self?.remove(coordinator: profileCoordinator)
            self?.remove(coordinator: favoritesCoordinator)
            self?.tabBarViewController = nil
            self?.goT​oAuth​()
        }
        guard let profileView = profileCoordinator.rootController,
              let recipesView = recipesCoordinator.rootController,
              let favoritesView = favoritesCoordinator.rootController else { return }

        tabBarViewController?.setViewControllers([
            recipesView,
            favoritesView,
            profileView
        ], animated: false)
        setAsRoot​(​_​: tabBarViewController ?? UITabBarController())
    }

    private func goT​oAuth​() {
        let authCoordinator = AuthCoordinator()
        let authModuleView = appBuilder.makeAuthModule(coordinator: authCoordinator)
        authCoordinator.setViewController(controller: authModuleView)
        authCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: authCoordinator)
            self?.goToMain()
        }
        guard let authView = authCoordinator.rootController else { return }
        add(coordinator: authCoordinator)
        setAsRoot​(​_​: authView)
    }
}
