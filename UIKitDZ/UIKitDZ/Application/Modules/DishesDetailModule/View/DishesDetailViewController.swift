// DishesDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol DishesDetailViewControllerProtocol: AnyObject {
    func updateData(_ data: Dish)
    func dismissSelf()
}

/// Экран для показа блюд
final class DishesDetailViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
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

    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(
            name: Constants.Texts.verdanaBoldFont,
            size: 20
        )
        return label
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(
            width: scrollView.bounds.width,
            height: 1000
        )

        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        return view
    }()

    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var nutrientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.backgroundColor = .white

        stackView.addArrangedSubviews([
            enercKcalNutriantStackView,
            carbohydratesKcalNutriantStackView,
            fatsNutriantStackView,
            proteinsNutriantStackView
        ])
        return stackView
    }()

    private lazy var enercKcalNutriantStackView = makeNutriantStackView(
        nutriantName: "Enerc kcal",
        nutriantCount: dish?.nutrients.enercKcal ?? ""
    )

    private lazy var carbohydratesKcalNutriantStackView = makeNutriantStackView(
        nutriantName: "Carbohydrates",
        nutriantCount: dish?.nutrients.carbohydrates ?? ""
    )

    private lazy var fatsNutriantStackView = makeNutriantStackView(
        nutriantName: "Fats",
        nutriantCount: dish?.nutrients.fats ?? ""
    )

    private lazy var proteinsNutriantStackView = makeNutriantStackView(
        nutriantName: "Proteins",
        nutriantCount: dish?.nutrients.proteins ?? ""
    )

    private let recipeView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 18
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
        return label
    }()

    // MARK: - Public Properties

    var presenter: DishesDetailPresenterProtocol?
    var dish: Dish?

    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchDish()
        setupNavigationBar()
        setupSubviews()
        configureSubviews()
        setupGradientLayer()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews([
            dishNameLabel,
            scrollView
        ])
        scrollView.addSubviews([
            contentView
        ])
        contentView.addSubviews([
            dishImageView,
            nutrientsStackView,
            recipeView
        ])
        recipeView.addSubviews([
            recipeLabel
        ])
    }

    private func configureSubviews() {
        configureDishNameLabelConstraints()
        configureScrollViewConstraints()
        configureContentViewConstraints()
        configureDishImageViewConstraints()
        configureNutrientsStackViewConstraints()
        configureRecipeViewConstraints()
        configureRecipeLabelConstraints()
    }

    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(.gradientBlue).cgColor,
            UIColor(.gradientWhite).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        recipeView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK: - DishesDetailViewController + DishesDetailViewControllerProtocol

extension DishesDetailViewController: DishesDetailViewControllerProtocol {
    func updateData(_ data: Dish) {
        dish = data
        dishNameLabel.text = dish?.dishName
        recipeLabel.text = dish?.recipe
        guard let imageName = dish?.dishImageName else { return }
        let image = UIImage(named: imageName)
        dishImageView.image = image
    }

    func dismissSelf() {
        dismiss(animated: true)
    }
}

/// Расширение для установки навигейшн бара
extension DishesDetailViewController {
    private func setupNavigationBar() {
        let rightCustomView = UIView()

        let shareButton = UIButton(type: .custom)
        shareButton.setImage(.shareButton, for: .normal)
        shareButton.contentMode = .scaleAspectFill
        shareButton.addTarget(
            self,
            action: #selector(didTapShareButton),
            for: .touchUpInside
        )

        let addToFavoritesButton = UIButton(type: .custom)
        addToFavoritesButton.setImage(.addToFavorites, for: .normal)
        addToFavoritesButton.contentMode = .scaleAspectFill
        addToFavoritesButton.addTarget(
            self,
            action: #selector(didTapAddToFavoritesButton),
            for: .touchUpInside
        )

        let leftCustomView = UIView()

        let backButton = UIButton(type: .custom)
        backButton.isUserInteractionEnabled = true
        backButton.setImage(.backButton, for: .normal)
        backButton.contentMode = .scaleAspectFill
        backButton.addTarget(
            self,
            action: #selector(didTapBackButton),
            for: .touchUpInside
        )

        // setupSubviews
        view.addSubviews([
            rightCustomView,
            leftCustomView
        ])
        rightCustomView.addSubviews([
            shareButton,
            addToFavoritesButton
        ])
        leftCustomView.addSubviews([
            backButton
        ])

        // configureSubviews
        configureRightCustomViewConstraints(
            rightCustomView: rightCustomView,
            addToFavoritesButton: addToFavoritesButton,
            shareButton: shareButton
        )

        configureLeftCustomViewConstraints(
            leftCustomView: leftCustomView,
            backButton: backButton
        )

        // setup customBar
        let customBarLeftButtonItem = UIBarButtonItem(
            customView: leftCustomView
        )
        let customBarRightButtonItem = UIBarButtonItem(
            customView: rightCustomView
        )
        navigationItem.leftBarButtonItem = customBarLeftButtonItem
        navigationItem.rightBarButtonItem = customBarRightButtonItem
    }

    private func configureRightCustomViewConstraints(
        rightCustomView: UIView,
        addToFavoritesButton: UIButton,
        shareButton: UIButton
    ) {
        NSLayoutConstraint.activate([
            rightCustomView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            rightCustomView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            rightCustomView.heightAnchor.constraint(
                equalToConstant: 44
            ),

            addToFavoritesButton.trailingAnchor.constraint(
                equalTo: rightCustomView.trailingAnchor
            ),
            addToFavoritesButton.centerYAnchor.constraint(
                equalTo: rightCustomView.centerYAnchor
            ),

            shareButton.trailingAnchor.constraint(
                equalTo: addToFavoritesButton.leadingAnchor,
                constant: -20
            ),
            shareButton.centerYAnchor.constraint(
                equalTo: rightCustomView.centerYAnchor
            ),
            shareButton.leadingAnchor.constraint(
                equalTo: rightCustomView.leadingAnchor
            )
        ])
    }

    private func configureLeftCustomViewConstraints(
        leftCustomView: UIView,
        backButton: UIButton
    ) {
        NSLayoutConstraint.activate([
            leftCustomView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            leftCustomView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            leftCustomView.heightAnchor.constraint(
                equalToConstant: 44
            ),

            backButton.leadingAnchor.constraint(
                equalTo: leftCustomView.leadingAnchor
            ),
            backButton.centerYAnchor.constraint(
                equalTo: leftCustomView.centerYAnchor
            )
        ])
    }
}

/// Расширение для установки расположений и размеров UI элементов

extension DishesDetailViewController {
    private func configureDishNameLabelConstraints() {
        NSLayoutConstraint.activate([
            dishNameLabel.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            dishNameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            dishNameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            dishNameLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configureScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: dishNameLabel.bottomAnchor,
                constant: Constants.Insets.vInset
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.layoutMarginsGuide.bottomAnchor
            )
        ])
    }

    private func configureContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor
                .constraint(equalTo: scrollView.widthAnchor) // Это ограничение исключает горизонтальную прокрутку.
        ])
    }

    private func configureDishImageViewConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            dishImageView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            dishImageView.widthAnchor.constraint(
                equalToConstant: 300
            ),
            dishImageView.heightAnchor.constraint(
                equalToConstant: 300
            )
        ])
    }

    private func configureNutrientsStackViewConstraints() {
        NSLayoutConstraint.activate([
            nutrientsStackView.topAnchor.constraint(
                equalTo: dishImageView.bottomAnchor,
                constant: 20
            ),
            nutrientsStackView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            nutrientsStackView.widthAnchor.constraint(
                equalTo: dishImageView.widthAnchor,
                constant: 10
            ),
            nutrientsStackView.heightAnchor.constraint(
                equalToConstant: 54
            )
        ])
    }

    private func configureRecipeViewConstraints() {
        NSLayoutConstraint.activate([
            recipeView.topAnchor.constraint(
                equalTo: nutrientsStackView.bottomAnchor,
                constant: 20
            ),
            recipeView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            recipeView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            recipeView.heightAnchor.constraint(
                equalToConstant: 1000
            )
        ])
    }

    private func configureRecipeLabelConstraints() {
        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(
                equalTo: recipeView.topAnchor,
                constant: Constants.Insets.top
            ),
            recipeLabel.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            recipeLabel.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                constant: -40
            ),
            recipeLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
        ])
    }
}

/// Расширение для добавления @objc методов
extension DishesDetailViewController {
    @objc private func didTapBackButton() {
        presenter?.moveToDishes()
        print("didTapBackButton")
    }

    @objc private func didTapShareButton() {
        print("didTapShareButton")
        presenter?.moveToDishes()
    }

    @objc private func didTapAddToFavoritesButton() {
        print("didTapAddToFavoritesButton")
    }
}

/// расширение для добавления функции создающую nutriantsStackView
extension DishesDetailViewController {
    private func makeNutriantStackView(
        nutriantName: String,
        nutriantCount: String
    ) -> UIStackView {
        lazy var nutrientStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 5
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
                size: 8
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
