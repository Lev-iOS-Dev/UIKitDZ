// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер
class ProfileViewController: UIViewController {
    // MARK: - Types

    typealias StringHandler = (String) -> ()

    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let navigationBarTitle = "Profile"
        static let alertChangeNameTitle = "Change your name and surname"
        static let alertTextFieldPlaceholder = "Name Surname"
        static let cancelActionTitle = "Cancel"
        static let okActionTextTitle = "Ok"
        static let alertLogoutTitle = "Are you sure you want to\nlog out?"
    }

    // MARK: - Visual Components

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserInfoTableCell.self, forCellReuseIdentifier: UserInfoTableCell.Constants.identifier)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: OptionsTableViewCell.Constants.identifier)
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: Public Properties

    var presenter: ProfilePresenter?

    // MARK: - Private Properties

    var passTextToCell: StringHandler?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupNavigationBar()
        setupTableViewConstraints()
    }

    // MARK: - Public Methods

    func showNameChangeAlert() {
        let alert = UIAlertController(title: Constants.alertChangeNameTitle, message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = Constants.alertTextFieldPlaceholder
            let cancelAction = UIAlertAction(title: Constants.cancelActionTitle, style: .cancel)
            let okAction = UIAlertAction(title: Constants.okActionTextTitle, style: .default) { [weak self] _ in
                let userText = alert.textFields?.first?.text
                self?.passTextToCell?(userText ?? "blank")
            }
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }

    func showLogoutAlert() {
        let alert = UIAlertController(title: Constants.alertLogoutTitle, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Constants.cancelActionTitle, style: .cancel)
        let okAction = UIAlertAction(title: Constants.okActionTextTitle, style: .default) { [weak self] _ in
            self?.presenter?.logout()
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([tableView], prepareForAutolayout: true)
    }

    private func setupNavigationBar() {
        navigationItem.title = Constants.navigationBarTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(
            name: Constants.verdanaBoldFont,
            size: 28
        ) ?? ""]
    }

    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.cellTypes.count ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = presenter?.cellTypes[section]
        switch cellType {
        case .userInfo, .bonuses, .privacy, .logout:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let safePresenter = presenter else { return UITableViewCell() }

        let cellType = safePresenter.cellTypes[indexPath.section]
        switch cellType {
        case .userInfo:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserInfoTableCell.Constants.identifier,
                for: indexPath
            ) as? UserInfoTableCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.profileStorage.userInfo)
            cell.showAlert = { [weak self] in
                self?.presenter?.showNameChangeAlert()
            }
            passTextToCell = { text in
                cell.changeUserName(text: text)
            }
            return cell
        case .bonuses:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.profileStorage.bonuses)
            cell.accessoryType = .disclosureIndicator
            return cell
        case .privacy:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.profileStorage.privacy)
            cell.accessoryType = .disclosureIndicator
            return cell
        case .logout:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OptionsTableViewCell.Constants.identifier,
                for: indexPath
            ) as? OptionsTableViewCell else { return UITableViewCell() }
            cell.configureCell(info: safePresenter.profileStorage.logout)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = presenter?.cellTypes[indexPath.section]
        switch selectedCell {
        case .userInfo:
            return
        case .bonuses:
            presenter?.pushBonusView()
        case .privacy:
            return
        case .logout:
            presenter?.showLogoutAlert()
        default:
            break
        }
    }
}
