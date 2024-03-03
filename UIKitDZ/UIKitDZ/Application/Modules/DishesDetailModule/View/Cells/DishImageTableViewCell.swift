// DishImageTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с изображением блюда
class DishImageTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "DishImageTableViewCell"
        static let weightImageName = "totalWightIcon"
        static let cookingTimeImageName = "timer"
        static let viewBackgroundColor = UIColor(red: 112 / 255, green: 185 / 255, blue: 190 / 255, alpha: 0.6)

        enum Insets {}

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }
    }

    // MARK: - Visual Components

    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 46
        view.clipsToBounds = true
        view.backgroundColor = .yellow
        return view
    }()

    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 0
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "dish6")
        return imageView
    }()

    private let totalWeightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = Constants.viewBackgroundColor
        stackView.layer.cornerRadius = 25
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let totalWeightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.weightImageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let totalWeightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaFont, size: 10)
        label.textColor = .white
        label.text = "793 g"
        return label
    }()

    private lazy var cookingTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = Constants.viewBackgroundColor
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 25
        stackView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()

    private let cookingTimeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constants.cookingTimeImageName)
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        return imageView
    }()

    private let cookingLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()

    private let cookingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaFont, size: 10)
        label.textColor = .white
        label.text = "Cooking time"
        return label
    }()

    private let cookingTimeMinutesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaFont, size: 10)
        label.textColor = .white
        label.text = "60 min"
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(data: Dish) {}

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubviews([mainView], prepareForAutolayout: true)
        mainView.addSubviews([dishImageView], prepareForAutolayout: true)
        dishImageView.addSubviews([totalWeightStackView, cookingTimeStackView], prepareForAutolayout: true)
        totalWeightStackView.addArrangedSubviews([totalWeightImageView, totalWeightLabel])
        cookingLabelsStackView.addArrangedSubviews([cookingTimeLabel, cookingTimeMinutesLabel])
        cookingTimeStackView.addArrangedSubviews([cookingTimeImageView, cookingLabelsStackView])
    }

    private func configureConstraints() {
        configureMainViewConstraints()
        configureDishImageViewConstraints()
        configureTotalWeightItemConstraints()
        configureCookingTimeItemConstraints()
    }

    private func configureMainViewConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 20
            ),
            mainView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainView.widthAnchor.constraint(
                equalToConstant: 300
            ),
            mainView.heightAnchor.constraint(
                equalToConstant: 300
            )
        ])
    }

    private func configureDishImageViewConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(
                equalTo: mainView.topAnchor
            ),
            dishImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            dishImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            dishImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
        ])
    }

    private func configureTotalWeightItemConstraints() {
        NSLayoutConstraint.activate([
            totalWeightStackView.topAnchor.constraint(
                equalTo: dishImageView.topAnchor, constant: 12
            ),
            totalWeightStackView.trailingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: -12),
            totalWeightStackView.widthAnchor.constraint(
                equalToConstant: 50
            ),
            totalWeightStackView.heightAnchor.constraint(
                equalToConstant: 50
            ),
            totalWeightImageView.topAnchor.constraint(equalTo: totalWeightStackView.topAnchor, constant: 5)
        ])
    }

    private func configureCookingTimeItemConstraints() {
        NSLayoutConstraint.activate([
            cookingTimeStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            cookingTimeStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            cookingTimeStackView.widthAnchor.constraint(
                equalToConstant: 124
            ),
            cookingTimeStackView.heightAnchor.constraint(
                equalToConstant: 48
            ),
            cookingTimeImageView.leadingAnchor.constraint(equalTo: cookingTimeStackView.leadingAnchor, constant: 8),
            cookingTimeImageView.heightAnchor.constraint(equalToConstant: 25),
            cookingTimeImageView.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
}
