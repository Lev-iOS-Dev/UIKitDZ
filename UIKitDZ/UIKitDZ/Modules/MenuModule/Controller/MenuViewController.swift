// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General menu screen
class MenuViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var brownBackgroundView = BrownBackgroundView(frame: view.bounds, yLogoPosition: 49)
    private lazy var whiteView = view.createWhiteView()
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать,\nГость"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = .brownLightCustom
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 20, y: 147)
        return label
    }()

    private lazy var guestButton: UIButton = {
        let button = GreenButtonView(
            title: "Г",
            parent: self.view,
            action: #selector(guestButtonAction),
            isEnabled: true
        )
        button.frame = CGRect(x: 326, y: 147, width: 44, height: 44)
        button.layer.cornerRadius = 22
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(brownBackgroundView, whiteView, welcomeLabel, guestButton)
    }

    private func configureSubviews() {}
    @objc func guestButtonAction() {}
}
