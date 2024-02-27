// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор главный
final class AppCoordinator: BaseCoodinator {
    private var tabBarViewController: TabBarController?
    private var appBuilder = AppBuilder()
    override func start() {
        if "admin" == "admin" {
            ​toMain​()
        } else {
            t​oAuth​()
        }
    }

    private func ​toMain​() {
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
            self?.t​oAuth​()
        }

        tabBarViewController?.setViewControllers([
            recipesCoordinator.rootController,
            favoritesCoordinator.rootController,
            profileCoordinator.rootController
        ], animated: false)
        setAsRoot​(​_​: tabBarViewController!)
    }

    private func t​oAuth​() {
        let authView = appBuilder.makeAuthModule()
        let authCoordinator = AuthCoordinator(rootController: authView)
        authCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: authCoordinator)
            self?.​toMain​()
        }
        add(coordinator: authCoordinator)
        authCoordinator.start()
    }
}
