// DishesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для показа блюд
class DishesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {}

        enum Texts {}
    }

    // MARK: Public Properties

    var presenter: DishesPresenter?

    // MARK: - Visual Components

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Private Methodes
}
