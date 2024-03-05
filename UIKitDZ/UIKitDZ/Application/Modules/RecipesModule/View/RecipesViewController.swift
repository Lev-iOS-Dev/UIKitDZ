// RecipesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с View
protocol RecipesViewControllerProtocol: AnyObject {
    /// Показывает алерт со сменой имени
    func updateData(_ data: [Category])
}

/// Экран для категорий блюд
final class RecipesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let top: CGFloat = 20
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
            static let bottom: CGFloat = -16
        }

        enum Texts {
            static let title = "Recipes"
        }
    }

    // MARK: Private Properties

    private var categories: [Category]?

    // MARK: Public Properties

    var presenter: RecipesPresenter?

    // MARK: - Visual Components

    private let recipesBarButtonItem: UIBarButtonItem = {
        let label = UILabel()
        label.text = Constants.Texts.title
        label.font = .systemFont(ofSize: 28, weight: .bold)
        let item = UIBarButtonItem(customView: label)
        return item
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        configureCollectionView()
        presenter?.fetchCategories()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            collectionView
        ])
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = recipesBarButtonItem
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Insets.top
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])
    }

    private func configureCollectionView() {
        collectionView.register(
            CategoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoriesCollectionViewCell().identifier
        )
    }
}

// MARK: - RecipesViewController + UICollectionViewDataSource

extension RecipesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let categories = categories else { return 1 }
        return categories.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoriesCollectionViewCell().identifier,
            for: indexPath
        ) as? CategoriesCollectionViewCell
        else { return UICollectionViewCell() }

        if let categories = categories {
            cell.configureWith(
                imageName: categories[indexPath.row].categoryImageName,
                name: categories[indexPath.row].categoryName
            )
        }

        return cell
    }
}

// MARK: - RecipesViewController + UICollectionViewDelegateFlowLayout

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch indexPath.row {
        case 0, 1, 7, 8:
            CGSize(
                width: 175,
                height: 175
            )
        case 2, 6:
            CGSize(
                width: 250,
                height: 250
            )
        case 3 ... 5:
            CGSize(
                width: 110,
                height: 110
            )

        case 7 ... 8:
            CGSize(
                width: 175,
                height: 175
            )
        default:
            CGSize(
                width: 400,
                height: 200
            )
        }
    }
}

// MARK: - RecipesViewController + UICollectionViewDelegate

extension RecipesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = categories?[indexPath.row] else {
            return
        }
        presenter?.moveToDishes(data: category)
    }
}

// MARK: - RecipesViewController + RecipesViewControllerProtocol

extension RecipesViewController: RecipesViewControllerProtocol {
    func updateData(_ data: [Category]) {
        categories = data
    }
}
