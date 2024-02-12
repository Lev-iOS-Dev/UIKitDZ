// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General menu screen
class MenuViewController: UIViewController {
    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews()
    }

    private func configureSubviews() {}
}
