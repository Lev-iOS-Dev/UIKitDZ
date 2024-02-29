// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран для показа избранных рецептов
class FavoritesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {}

        enum Texts {}
    }

    // MARK: Public Properties

    var presenter: FavoritesPresenter?

    // MARK: - Visual Components

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Private Methodes
}
