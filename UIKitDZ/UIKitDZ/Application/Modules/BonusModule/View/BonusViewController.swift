// BonusViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol BonusViewControllerProtocol: AnyObject {
    /// Закрывает текущий экран
    func closeScreen()
    /// Устанавливает данные о количестве бонусов
    func setBonusesCount(count: String)
}

/// Экран с бонусами
final class BonusViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let xButtonImageName = "xmark"

        enum Texts {
            static let bonusesLabelText = "Your bonuses"
        }

        enum ImageNames {
            static let boxImageName = "box"
            static let goldenStarImageName = "goldenStar"
        }
    }

    // MARK: - Visual Components

    private let bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.bonusesLabelText
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 20)
        label.textColor = .optionsLabelText
        return label
    }()

    private let bonusesBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageNames.boxImageName)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let goldenStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageNames.goldenStarImageName)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let bonusCountLabel: UILabel = {
        let label = UILabel()
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

    var presenter: BonusPresenterProtocol?

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
        presenter?.fetchBonuses()
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
        presenter?.closeScreen()
    }
}

// MARK: - BonusViewController + BonusViewControllerProtocol

extension BonusViewController: BonusViewControllerProtocol {
    func closeScreen() {
        dismiss(animated: true)
    }

    func setBonusesCount(count: String) {
        bonusCountLabel.text = count
    }
}
