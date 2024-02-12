// AuthViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
class AuthViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var brownBackgroundView = BrownBackgroundView(frame: view.bounds, yLogoPosition: 103)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(brownBackgroundView)
    }

    private func configureSubviews() {}
}
