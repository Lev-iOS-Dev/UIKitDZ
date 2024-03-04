// NutrientsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для количества КБЖУ
final class NutrientsTableViewCell: UITableViewCell {
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
        nutriantCountLabel: enercKalCountLabel
    )

    private lazy var enercKalCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont(
            name: Constants.Texts.verdanaFont,
            size: 10
        )
        return label
    }()

    private lazy var carbohydratesKcalNutriantStackView = makeNutriantStackView(
        nutriantName: "Carbohydrates",
        nutriantCountLabel: carhbohydratesCountLabel
    )

    private let carhbohydratesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont(
            name: Constants.Texts.verdanaFont,
            size: 10
        )
        return label
    }()

    private lazy var fatsNutriantStackView = makeNutriantStackView(
        nutriantName: "Fats",
        nutriantCountLabel: fatsCountLabel
    )

    private let fatsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont(
            name: Constants.Texts.verdanaFont,
            size: 10
        )
        return label
    }()

    private lazy var proteinsNutriantStackView = makeNutriantStackView(
        nutriantName: "Proteins",
        nutriantCountLabel: proteinsCountLabel
    )

    private let proteinsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textColor = .myBackground
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont(
            name: Constants.Texts.verdanaFont,
            size: 10
        )
        return label
    }()

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

    func configure(data: Dish) {
        enercKalCountLabel.text = data.nutrients.enercKcal
        carhbohydratesCountLabel.text = data.nutrients.carbohydrates
        fatsCountLabel.text = data.nutrients.fats
        proteinsCountLabel.text = data.nutrients.proteins
    }

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
        nutriantCountLabel: UILabel
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
                nutriantCountLabel
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
        return nutrientStackView
    }
}
