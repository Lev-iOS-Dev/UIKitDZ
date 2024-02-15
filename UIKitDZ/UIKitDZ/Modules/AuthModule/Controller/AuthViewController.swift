// AuthViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
final class AuthViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var brownBackgroundView = BrownBackgroundView(frame: view.bounds, yLogoPosition: 103)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .systemBackground
        view.addSubViews(brownBackgroundView)
    }
}
