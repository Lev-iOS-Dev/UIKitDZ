// DishesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol DishesViewControllerProtocol: AnyObject {
    /// Обновляет состояние у кнопок сортировки
    func updateState(sender: CustomControlView)
    /// Обновляет UI  у кнопки сортировки по калориям
    func updateCaloriesView()
    /// Обновляет UI  у кнопки сортировки по времени
    func updateTimeView()
}

/// Экран для показа блюд
class DishesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let normalFilterButtonImageName = "stack"
        static let lightNormalFilterButtonImageName = "lightStackNormal"
        static let lightVerticalFilterButtonImageName = "lightStackVertical"
        static let backButtonImageName = "arrow"

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
            static let searchBarPlaceholder = "Search recipes"
            static let caloriesSortingLabelText = "Calories"
            static let timeSortingLabelText = "Time"
        }
    }

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

    private lazy var caloriesView = makeSortingView()
    private lazy var caloriesLabel = makeSortingLabel(text: Constants.Texts.caloriesSortingLabelText)
    private lazy var caloriesImageView: UIImageView = makeSortingImageView(
        imageName: Constants
            .normalFilterButtonImageName
    )
    private lazy var timeView = makeSortingView()
    private lazy var timeLabel = makeSortingLabel(text: Constants.Texts.timeSortingLabelText)
    private lazy var timeImageView: UIImageView = makeSortingImageView(
        imageName: Constants
            .normalFilterButtonImageName
    )

    // MARK: - Public Properties

    var presenter: DishesPresenterProtocol?
    var navigationItemMainText = "Fish"

    // MARK: - Private Properties

    private var caloriesControlCurrentState: States = .none {
        didSet {
            updateCaloriesControlUI()
        }
    }

    private var timeControlCurrentState: States = .none {
        didSet {
            updateTimeControlUI()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
        setupTableViewConstraints()
        setupSearchBarConstraints()
        setupCaloriesSortingItem()
        setupTimeSortingItem()
        setupSortingItemsAction()
    }

    // MARK: - Private Methodes

    private func setupNavigationBar() {
        let customView = UIView()
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: Constants.backButtonImageName), for: .normal)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        button.contentMode = .scaleAspectFill
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaBoldFont, size: 28)
        label.text = navigationItemMainText
        label.textAlignment = .left
        view.addSubviews([customView], prepareForAutolayout: true)
        customView.addSubviews([button, label], prepareForAutolayout: true)
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.topAnchor.constraint(equalTo: view.topAnchor),
            customView.heightAnchor.constraint(equalToConstant: 44),
            button.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            button.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: customView.trailingAnchor)
        ])

        let customBarButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = customBarButtonItem
    }

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews([recipesSearchBar, tableView, caloriesView, timeView], prepareForAutolayout: true)
        caloriesView.addSubviews([caloriesImageView, caloriesLabel], prepareForAutolayout: true)
        timeView.addSubviews([timeImageView, timeLabel], prepareForAutolayout: true)
    }

    private func setupSortingItemsAction() {
        caloriesView.addTarget(self, action: #selector(sortingTapped(sender:)), for: .touchUpInside)
        timeView.addTarget(self, action: #selector(sortingTapped(sender:)), for: .touchUpInside)
    }

    private func setupCaloriesSortingItem() {
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

    private func setupTimeSortingItem() {
        NSLayoutConstraint.activate([
            timeView.leadingAnchor.constraint(equalTo: caloriesView.trailingAnchor, constant: 11),
            timeView.topAnchor.constraint(equalTo: recipesSearchBar.bottomAnchor, constant: 20),
            timeView.widthAnchor.constraint(equalToConstant: 90),
            timeView.heightAnchor.constraint(equalToConstant: 36),
            timeLabel.leadingAnchor.constraint(equalTo: timeView.leadingAnchor, constant: 12),
            timeLabel.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 10),
            timeLabel.widthAnchor.constraint(equalToConstant: 46),
            timeLabel.heightAnchor.constraint(equalToConstant: 16),
            timeImageView.leadingAnchor.constraint(equalTo: timeImageView.trailingAnchor, constant: -4),
            timeImageView.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            timeImageView.trailingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: -12),
            timeImageView.widthAnchor.constraint(equalToConstant: 16),
            timeImageView.heightAnchor.constraint(equalToConstant: 16)
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

    @objc private func backTapped() {
        presenter?.moveToRecipes()
    }

    @objc private func sortingTapped(sender: CustomControlView) {
        presenter?.updateSortingViewState(sender: sender)
    }

    @objc private func updateCaloriesControlUI() {
        presenter?.updateCaloriesControlUI()
    }

    @objc private func updateTimeControlUI() {
        presenter?.updateTimeControlUI()
    }
}

/// Расширили класс, добавив функции для удобной инициализации одинаковых UI элементов

extension DishesViewController {
    // MARK: - Private Properties

    private func makeSortingView() -> CustomControlView {
        let view = CustomControlView()
        view.backgroundColor = .myLightGray
        view.layer.cornerRadius = 15
        return view
    }

    private func makeSortingImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    private func makeSortingLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaFont, size: 16)
        label.text = text
        label.textAlignment = .center
        return label
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
//        cell.configureCell(info: Dish)
        return cell
    }
}

// MARK: - DishesViewController + UITableViewDelegate

extension DishesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - DishesViewController + DishesViewControllerProtocol

extension DishesViewController: DishesViewControllerProtocol {
    func updateState(sender: CustomControlView) {
        if sender == caloriesView {
            switch caloriesControlCurrentState {
            case .none:
                caloriesControlCurrentState = .lowToHigh
            case .lowToHigh:
                caloriesControlCurrentState = .highToLow
            case .highToLow:
                caloriesControlCurrentState = .none
            }
        } else {
            switch timeControlCurrentState {
            case .none:
                timeControlCurrentState = .lowToHigh
            case .lowToHigh:
                timeControlCurrentState = .highToLow
            case .highToLow:
                timeControlCurrentState = .none
            }
        }
    }

    func updateCaloriesView() {
        switch caloriesControlCurrentState {
        case .none:
            caloriesView.backgroundColor = .myLightGray
            caloriesLabel.textColor = .black
            caloriesImageView.image = UIImage(named: Constants.normalFilterButtonImageName)
        case .lowToHigh:
            caloriesView.backgroundColor = .myFilterButtonBackground
            caloriesLabel.textColor = .white
            caloriesImageView.image = UIImage(named: Constants.lightNormalFilterButtonImageName)
        case .highToLow:
            caloriesView.backgroundColor = .myFilterButtonBackground
            caloriesLabel.textColor = .white
            caloriesImageView.image = UIImage(named: Constants.lightVerticalFilterButtonImageName)
        }
    }

    func updateTimeView() {
        switch timeControlCurrentState {
        case .none:
            timeView.backgroundColor = .myLightGray
            timeLabel.textColor = .black
            timeImageView.image = UIImage(named: Constants.normalFilterButtonImageName)
        case .lowToHigh:
            timeView.backgroundColor = .myFilterButtonBackground
            timeLabel.textColor = .white
            timeImageView.image = UIImage(named: Constants.lightNormalFilterButtonImageName)
        case .highToLow:
            timeView.backgroundColor = .myFilterButtonBackground
            timeLabel.textColor = .white
            timeImageView.image = UIImage(named: Constants.lightVerticalFilterButtonImageName)
        }
    }
}
