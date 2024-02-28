// BonusViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер
class BonusViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let xButtonImageName = "xmark"

        enum Texts {
            static let bonusesLabelText = "Your bonuses"
            static let bonusesCount = "100"
        }

        enum imageNames {
            static let boxImageName = "box"
            static let goldenStarImageName = "goldenStar"
        }
    }

    // MARK: - Visual Components

    private var bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.bonusesLabelText
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 20)
        label.textColor = .optionsLabelText
        return label
    }()

    private var bonusesBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.imageNames.boxImageName)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var goldenStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.imageNames.goldenStarImageName)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var bonusCountLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.bonusesCount
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 30)
        label.textAlignment = .left
        return label
    }()

    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.xButtonImageName), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()

    // MARK: Public Properties

    var presenter: BonusPresenter?

    // MARK: - Init

    init(presenter: BonusPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupBonusesLabelConstraints()
        setupBonusesBoxImageViewConstraints()
        setupGoldenStarImageViewConstraints()
        setupBonusCountLabelConstraints()
        setupXbuttonConstraints()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews(
            [bonusesLabel, bonusesBoxImageView, goldenStarImageView, bonusCountLabel, xButton],
            prepareForAutolayout: true
        )
    }

    private func setupBonusesLabelConstraints() {
        NSLayoutConstraint.activate([
            bonusesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bonusesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 46),
            bonusesLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    private func setupBonusesBoxImageViewConstraints() {
        NSLayoutConstraint.activate([
            bonusesBoxImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bonusesBoxImageView.topAnchor.constraint(equalTo: bonusesLabel.bottomAnchor, constant: 13),
            bonusesBoxImageView.widthAnchor.constraint(equalToConstant: 150),
            bonusesBoxImageView.heightAnchor.constraint(equalToConstant: 136.2)
        ])
    }

    private func setupGoldenStarImageViewConstraints() {
        NSLayoutConstraint.activate([
            goldenStarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 141),
            goldenStarImageView.topAnchor.constraint(equalTo: bonusesBoxImageView.bottomAnchor, constant: 27.8),
            goldenStarImageView.heightAnchor.constraint(equalToConstant: 35),
            goldenStarImageView.widthAnchor.constraint(equalToConstant: 35)
        ])
    }

    private func setupBonusCountLabelConstraints() {
        NSLayoutConstraint.activate([
            bonusCountLabel.leadingAnchor.constraint(equalTo: goldenStarImageView.trailingAnchor, constant: 11),
            bonusCountLabel.topAnchor.constraint(equalTo: goldenStarImageView.topAnchor),
            bonusCountLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    private func setupXbuttonConstraints() {
        NSLayoutConstraint.activate([
            xButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            xButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            xButton.widthAnchor.constraint(equalToConstant: 24),
            xButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc private func cancelTapped() {
        dismiss(animated: true)
    }
}
