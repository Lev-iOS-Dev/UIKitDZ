// RecipesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ekjrvnekvjn
class RecipePresenter {
    // MARK: - Private Properties

    private weak var view: UIViewController?
    private weak var recipesCoordinator: RecipesCoordinator?

    // MARK: - Initializers

    init(view: UIViewController, coordinator: RecipesCoordinator) {
        self.view = view
        recipesCoordinator = coordinator
    }
}
