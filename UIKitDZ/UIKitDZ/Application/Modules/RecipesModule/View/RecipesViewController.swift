// RecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для категорий блюд
final class RecipesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {}

        enum Texts {}
    }

    // MARK: Public Properties

    var presenter: RecipesPresenter?

    // MARK: - Visual Components

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("ааа", for: .normal)
        button.backgroundColor = .loginButtonBackground
        button.layer.cornerRadius = 12
        button.addTarget(
            self,
            action: #selector(didTaphrbfrhButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            loginButton
        ])
        view.backgroundColor = .white
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func didTaphrbfrhButton(_ sender: UIButton) {
        presenter?.moveToDishes()
    }
}
