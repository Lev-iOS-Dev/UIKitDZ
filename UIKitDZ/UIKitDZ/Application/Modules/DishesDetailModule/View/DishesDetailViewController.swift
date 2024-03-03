// DishesDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol DishesDetailViewControllerProtocol: AnyObject {
//    func updateData(_ data: Dish)
//    func dismissSelf()
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
        label.text = "Simple Fish And Corn"
        label.numberOfLines = 0
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            DishImageTableViewCell.self,
            forCellReuseIdentifier: DishImageTableViewCell.Constants.identifier
        )
        tableView.register(
            NutrientsTableViewCell.self,
            forCellReuseIdentifier: NutrientsTableViewCell.Constants.identifier
        )
        tableView.register(
            DetailRecipeTableViewCell.self,
            forCellReuseIdentifier: DetailRecipeTableViewCell.Constants.identifier
        )
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
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

    let cellTypes: [DishesDetailCellType] = [.dishImageItem, .nutrients, .dishRecipe]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchDish()
        setupNavigationBar()
        setupSubviews()
        configureSubviews()
//        setupGradientLayer()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews([tableView], prepareForAutolayout: true)
//        scrollView.addSubviews([
//            contentView
//        ])
//        contentView.addSubviews([
//            dishImageView,
//            nutrientsStackView,
//            recipeView
//        ])
//        recipeView.addSubviews([
//            recipeLabel
//        ])
    }

    private func configureSubviews() {
        configureTableViewConstraints()
//        configureScrollViewConstraints()
//        configureContentViewConstraints()
//        configureNutrientsStackViewConstraints()
//        configureRecipeViewConstraints()
//        configureRecipeLabelConstraints()
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

// MARK: - DishesDetailViewController + UITableViewDataSource

extension DishesDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellTypes[section] {
        case .dishImageItem, .dishRecipe, .nutrients:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.section]
        switch cellType {
        case .dishImageItem:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DishImageTableViewCell.Constants.identifier,
                for: indexPath
            ) as? DishImageTableViewCell else { return UITableViewCell() }
            return cell
        case .nutrients:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NutrientsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? NutrientsTableViewCell else { return UITableViewCell() }
            return cell
        case .dishRecipe:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailRecipeTableViewCell.Constants.identifier,
                for: indexPath
            ) as? DetailRecipeTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
}

// MARK: - DishesDetailViewController + UITableViewDelegate

extension DishesDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch cellTypes[section] {
        case .dishImageItem:
            return dishNameLabel
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch cellTypes[section] {
        case .dishImageItem:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
}

// MARK: - DishesDetailViewController + DishesDetailViewControllerProtocol

extension DishesDetailViewController: DishesDetailViewControllerProtocol {
//    func updateData(_ data: Dish) {
//        dish = data
//        dishNameLabel.text = dish?.dishName
//        recipeLabel.text = dish?.recipe
//        guard let imageName = dish?.dishImageName else { return }
//        let image = UIImage(named: imageName)
//        dishImageView.image = image
//    }
//
//    func dismissSelf() {
//        dismiss(animated: true)
//    }
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
            backButton.trailingAnchor.constraint(equalTo: leftCustomView.trailingAnchor),
            backButton.centerYAnchor.constraint(
                equalTo: leftCustomView.centerYAnchor
            )
        ])
    }
}

/// Расширение для установки расположений и размеров UI элементов

extension DishesDetailViewController {
    private func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.layoutMarginsGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

//    private func configureScrollViewConstraints() {
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(
//                equalTo: dishNameLabel.bottomAnchor,
//                constant: Constants.Insets.vInset
//            ),
//            scrollView.leadingAnchor.constraint(
//                equalTo: view.leadingAnchor
//            ),
//            scrollView.trailingAnchor.constraint(
//                equalTo: view.trailingAnchor
//            ),
//            scrollView.bottomAnchor.constraint(
//                equalTo: view.layoutMarginsGuide.bottomAnchor
//            )
//        ])
//    }

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

//    private func configureRecipeViewConstraints() {
//        NSLayoutConstraint.activate([
//            recipeView.topAnchor.constraint(
//                equalTo: nutrientsStackView.bottomAnchor,
//                constant: 20
//            ),
//            recipeView.leadingAnchor.constraint(
//                equalTo: contentView.leadingAnchor
//            ),
//            recipeView.trailingAnchor.constraint(
//                equalTo: contentView.trailingAnchor
//            ),
//            recipeView.heightAnchor.constraint(
//                equalToConstant: 1000
//            )
//        ])
//    }

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
    }

    @objc private func didTapAddToFavoritesButton() {
        print("didTapAddToFavoritesButton")
    }
}
