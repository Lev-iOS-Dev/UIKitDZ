// DetailRecipeTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для подробного описания рецепта
final class DetailRecipeTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "DetailRecipeTableViewCell"

        enum Insets {
            static let gradientStartPoint = CGPoint(x: 0.5, y: 0)
            static let gradientEndPoint = CGPoint(x: 0.5, y: 1)
        }

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }
    }

    // MARK: - Visual Components

    private let recipeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return view
    }()

    private let recipeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .loginLabelForeground
        label.font = .myFont(fontName: Constants.Texts.verdanaFont, fontSize: 14)
        return label
    }()

    // MARK: - Private Properties

    private let gradientLayer = CAGradientLayer()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureRecipeViewConstraints()
        configureRecipeLabelConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configureRecipeViewConstraints()
        configureRecipeLabelConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientLayer()
    }

    // MARK: - Public Methods

    func configure(data: Dish) {
        recipeLabel.text = data.recipe
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubviews([recipeView], prepareForAutolayout: true)
        recipeView.addSubviews([recipeLabel], prepareForAutolayout: true)
    }

    private func setupGradientLayer() {
        gradientLayer.frame = recipeView.bounds
        gradientLayer.colors = [
            UIColor(.gradientBlue).cgColor,
            UIColor(.gradientWhite).cgColor
        ]
        gradientLayer.startPoint = Constants.Insets.gradientStartPoint
        gradientLayer.endPoint = Constants.Insets.gradientEndPoint
        recipeView.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func configureRecipeViewConstraints() {
        NSLayoutConstraint.activate([
            recipeView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 20
            ),
            recipeView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            recipeView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            recipeView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }

    private func configureRecipeLabelConstraints() {
        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(
                equalTo: recipeView.topAnchor,
                constant: 27
            ),
            recipeLabel.leadingAnchor.constraint(
                equalTo: recipeView.leadingAnchor, constant: 27
            ),
            recipeLabel.trailingAnchor.constraint(
                equalTo: recipeView.trailingAnchor, constant: -27
            ),
            recipeLabel.widthAnchor.constraint(
                equalToConstant: 336
            ),
            recipeLabel.bottomAnchor.constraint(
                equalTo: recipeView.bottomAnchor
            ),
        ])
    }
}
