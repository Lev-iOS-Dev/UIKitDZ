// RecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер
class RecipesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {}

        enum Texts {}
    }

    // MARK: Public Properties

    var presenter: RecipePresenter?

    // MARK: - Visual Components

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    // MARK: - Private Methodes
}
