// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General menu screen
final class MenuViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .white
        view.addSubViews()
    }
}
