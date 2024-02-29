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
        let recipesModuleView = appBuilder.makeRecipesModule()
        let recipesCoordinator = RecipesCoordinator(
            rootController: recipesModuleView
        )
        recipesModuleView.presenter?.recipesCoordinator = recipesCoordinator
        add(coordinator: recipesCoordinator)

        /// Set Favorites
        let favoritesModuleView = appBuilder.makeFavoritesModule()
        let favoritesCoordinator = FavoritesCoordinator(
            rootController: favoritesModuleView
        )
        favoritesModuleView.presenter?.favoritesCoordinator = favoritesCoordinator
        add(coordinator: favoritesCoordinator)

        /// Set Profile
        let profileView = appBuilder.makeProfileModule()
        let profileCoordinator = ProfileCoordinator(rootController: profileView)
        profileView.presenter?.profileCoordinator = profileCoordinator
        add(coordinator: profileCoordinator)

        profileCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: recipesCoordinator)
            self?.remove(coordinator: profileCoordinator)
            self?.tabBarViewController = nil
            self?.goT​oAuth​()
        }

        tabBarViewController?.setViewControllers([
            recipesCoordinator.rootController,
            favoritesCoordinator.rootController,
            profileCoordinator.rootController
        ], animated: false)
        setAsRoot​(​_​: tabBarViewController ?? UITabBarController())
    }

    private func goT​oAuth​() {
        let authModuleView = appBuilder.makeAuthModule()
        let authCoordinator = AuthCoordinator(rootController: authModuleView)
        authModuleView.presenter?.authCoordinator = authCoordinator
        authCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: authCoordinator)
            self?.goToMain()
        }
        add(coordinator: authCoordinator)
        setAsRoot​(​_​: authModuleView)
    }
}
