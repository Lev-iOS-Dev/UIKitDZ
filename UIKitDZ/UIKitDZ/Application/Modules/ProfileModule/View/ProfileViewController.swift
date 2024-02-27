// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер
class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {}

        enum Texts {}
    }

    // MARK: Public Properties

    var presenter: ProfilePresenter?

    // MARK: - Visual Components

    private lazy var navButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("To terms", for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapNavButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        view.backgroundColor = .yellow
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([navButton])
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            navButton.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 300
            ),
            navButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 100
            ),
            navButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -100
            ),
            navButton.widthAnchor.constraint(
                equalToConstant: 300
            ),
            navButton.heightAnchor.constraint(
                equalToConstant: 100
            )
        ])
    }

    @objc private func didTapNavButton(_ sender: UIButton) {
        presenter?.onTapTermsOfUse()
    }
}
