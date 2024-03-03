// NutrientsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для количества КБЖУ
class NutrientsTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "NutrientsTableViewCell"

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

    private lazy var enercKcalNutriantStackView = makeNutriantStackView(
        nutriantName: "Enerc kcal",
        nutriantCount: "1322 kcal"
    )

    private lazy var carbohydratesKcalNutriantStackView = makeNutriantStackView(
        nutriantName: "Carbohydrates",
        nutriantCount: "10,78 g"
    )

    private lazy var fatsNutriantStackView = makeNutriantStackView(
        nutriantName: "Fats",
        nutriantCount: "10,00 g"
    )

    private lazy var proteinsNutriantStackView = makeNutriantStackView(
        nutriantName: "Proteins",
        nutriantCount: "97,30 g"
    )

    private lazy var nutrientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.addArrangedSubviews([
            enercKcalNutriantStackView,
            carbohydratesKcalNutriantStackView,
            fatsNutriantStackView,
            proteinsNutriantStackView
        ])
        return stackView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureNutrientsStackViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure() {}

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubviews([nutrientsStackView], prepareForAutolayout: true)
    }

    private func configureNutrientsStackViewConstraints() {
        NSLayoutConstraint.activate([
            nutrientsStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            nutrientsStackView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            nutrientsStackView.widthAnchor.constraint(equalToConstant: 311),
            nutrientsStackView.heightAnchor.constraint(
                equalToConstant: 58
            )
        ])
    }
}

/// Расширение для добавления функции создающую nutriantsStackView
extension NutrientsTableViewCell {
    private func makeNutriantStackView(
        nutriantName: String,
        nutriantCount: String
    ) -> UIStackView {
        lazy var nutrientStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.backgroundColor = UIColor.myBackground
            stackView.layer.cornerRadius = 16
            stackView.layer.masksToBounds = false
            stackView.layer.borderColor = UIColor.myBackground.cgColor
            stackView.layer.borderWidth = 2

            stackView.addArrangedSubviews([
                nutrientTypeLabel,
                nutrientCountLabel
            ])
            return stackView
        }()

        let nutrientTypeLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = nutriantName
            label.textAlignment = .center
            label.textColor = .white

            label.font = UIFont(
                name: Constants.Texts.verdanaFont,
                size: 9
            )
            return label
        }()

        let nutrientCountLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = nutriantCount
            label.textColor = .myBackground
            label.backgroundColor = .white
            label.textAlignment = .center
            label.font = UIFont(
                name: Constants.Texts.verdanaFont,
                size: 10
            )
            return label
        }()

        return nutrientStackView
    }
}
