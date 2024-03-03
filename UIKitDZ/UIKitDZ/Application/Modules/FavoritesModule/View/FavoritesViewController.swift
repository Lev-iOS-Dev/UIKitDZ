// FavoritesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для показа избранных рецептов
final class FavoritesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let top: CGFloat = 12
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let differenceInset: CGFloat = -40
        }

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
            static let title = "Favorites"
            static let titleLabel = "There's nothing here yet"
            static let messageLabel = "Add interesting recipes to make ordering products\nconvenient"
        }
    }

    // MARK: Public Properties

    private var favoriteDishesStorage = FavoriteDishesStorage()
    private var isDataEmpty: Bool = false

    // MARK: Public Properties

    var presenter: FavoritesPresenter?

    // MARK: - Visual Components

    private let favoritesBarButtonItem: UIBarButtonItem = {
        let label = UILabel()
        label.text = Constants.Texts.title
        label.font = .systemFont(ofSize: 28, weight: .bold)
        let item = UIBarButtonItem(customView: label)
        return item
    }()

    private let noFavoritesStackView = makeMessageStackView(
        image: .noFavoritesIcon,
        title: Constants.Texts.titleLabel,
        message: Constants.Texts.messageLabel
    )

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            DishesTableViewCell.self,
            forCellReuseIdentifier: DishesTableViewCell.Constants.identifier
        )
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDishes()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            noFavoritesStackView,
            tableView
        ])
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = favoritesBarButtonItem
    }

    private func configureSubviews() {
        configureNoFavoritesStackViewConstraints()
        configureTableViewConstraints()
    }

    private func updateDishes() {
        isDataEmpty = Int.random(in: 0 ... 1) == 1
        tableView.isHidden = isDataEmpty
        noFavoritesStackView.isHidden = !isDataEmpty
    }
}

/// Расширение для установки расположений и размеров UI элементов
extension FavoritesViewController {
    private func configureNoFavoritesStackViewConstraints() {
        NSLayoutConstraint.activate([
            noFavoritesStackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            noFavoritesStackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            noFavoritesStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            noFavoritesStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            noFavoritesStackView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                constant: Constants.Insets.differenceInset
            )
        ])
    }

    private func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Insets.top
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
}

// MARK: - FavoritesViewController + UITableViewDataSource

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteDishesStorage.favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DishesTableViewCell.Constants.identifier,
            for: indexPath
        ) as? DishesTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none

        cell.configureCell(info: favoriteDishesStorage.favorites[indexPath.row])

        return cell
    }
}
