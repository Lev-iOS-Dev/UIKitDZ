// DishesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol DishesViewControllerProtocol {}

/// Экран для показа блюд
class DishesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let filterButtonsImageName = "stack"

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
            static let searchBarPlaceholder = "Search recipes"
            static let caloriesFilterButtonText = "Calories"
            static let timeFIlterButtonText = "Time"
        }
    }

    // MARK: Public Properties

    var presenter: DishesPresenterProtocol?

    // MARK: - Visual Components

    private let recipesSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 12
        searchBar.searchTextField.backgroundColor = .mySearchBarBackground
        searchBar.placeholder = Constants.Texts.searchBarPlaceholder
        return searchBar
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DishesTableViewCell.self, forCellReuseIdentifier: DishesTableViewCell.Constants.identifier)
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private lazy var caloriesView: Filter = {
        let view = Filter()
        view.backgroundColor = .myLightGray
        view.layer.cornerRadius = 15
        return view
    }()

    private let caloriesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaFont, size: 16)
        label.text = Constants.Texts.caloriesFilterButtonText
        label.textAlignment = .center
        return label
    }()

    private let caloriesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.filterButtonsImageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupTableViewConstraints()
        setupSearchBarConstraints()
        setupCaloriesItem()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews([recipesSearchBar, tableView, caloriesView], prepareForAutolayout: true)
        caloriesView.addSubviews([caloriesImageView, caloriesLabel], prepareForAutolayout: true)
    }

    private func setupCaloriesItem() {
        NSLayoutConstraint.activate([
            caloriesView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            caloriesView.topAnchor.constraint(equalTo: recipesSearchBar.bottomAnchor, constant: 20),
            caloriesView.widthAnchor.constraint(equalToConstant: 112),
            caloriesView.heightAnchor.constraint(equalToConstant: 36),
            caloriesLabel.leadingAnchor.constraint(equalTo: caloriesView.leadingAnchor, constant: 12),
            caloriesLabel.topAnchor.constraint(equalTo: caloriesView.topAnchor, constant: 10),
            caloriesLabel.widthAnchor.constraint(equalToConstant: 68),
            caloriesLabel.heightAnchor.constraint(equalToConstant: 16),
            caloriesImageView.leadingAnchor.constraint(equalTo: caloriesImageView.trailingAnchor, constant: -4),
            caloriesImageView.topAnchor.constraint(equalTo: caloriesLabel.topAnchor),
            caloriesImageView.trailingAnchor.constraint(equalTo: caloriesView.trailingAnchor, constant: -12),
            caloriesImageView.widthAnchor.constraint(equalToConstant: 16),
            caloriesImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

    private func setupSearchBarConstraints() {
        NSLayoutConstraint.activate([
            recipesSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            recipesSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            recipesSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            recipesSearchBar.heightAnchor.constraint(equalToConstant: 36),
            recipesSearchBar.widthAnchor.constraint(equalToConstant: 348)
        ])
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - DishesViewController + UITableViewDataSource

extension DishesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DishesTableViewCell.Constants.identifier,
            for: indexPath
        ) as? DishesTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - DishesViewController + UITableViewDelegate

extension DishesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
