// DetailRecipeTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для подробного описания рецепта
class DetailRecipeTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "DetailRecipeTableViewCell"

        enum Insets {
            static let vInset: CGFloat = 20
            static let top: CGFloat = 20
            static let leading: CGFloat = 40
            static let trailing: CGFloat = -40
            static let labelHeight: CGFloat = 30
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
        label.font = UIFont(name: Constants.Texts.verdanaFont, size: 14)
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
        fatalError("init(coder:) has not been implemented")
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
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        recipeView.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func configureRecipeViewConstraints() {
        NSLayoutConstraint.activate([
            recipeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            recipeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func configureRecipeLabelConstraints() {
        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(
                equalTo: recipeView.topAnchor,
                constant: 27
            ),
            recipeLabel.leadingAnchor.constraint(equalTo: recipeView.leadingAnchor, constant: 27),
            recipeLabel.trailingAnchor.constraint(equalTo: recipeView.trailingAnchor, constant: -27),
            recipeLabel.widthAnchor.constraint(equalToConstant: 336),
            recipeLabel.bottomAnchor.constraint(
                equalTo: recipeView.bottomAnchor
            ),
        ])
    }
}
