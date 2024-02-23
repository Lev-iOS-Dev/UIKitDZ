// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для показа профиля пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum Insets {
            static let top: CGFloat = 12
        }
    }

    private let contentType: [ContentType] = [
        .profile, .actions, .posts, .images
    ]

    enum ContentType {
        case profile
        case actions
        case posts
        case images
    }

    private let userData = UserData()

    // MARK: - Visual Components

    private let tableView = UITableView()

    // MARK: - Live Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        configureTableView()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.addSubviews([
            tableView
        ])
        view.backgroundColor = .white
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Insets.top
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }

    private func configureTableView() {
        tableView.register(
            ProfileTableViewCell.self,
            forCellReuseIdentifier: "ProfileTableViewCell"
        )
        tableView.register(
            ProfileActionsTableViewCell.self,
            forCellReuseIdentifier: "ProfileActionsTableViewCell"
        )
        tableView.register(
            UserPostsTableViewCell.self,
            forCellReuseIdentifier: "UserPostsTableViewCell"
        )
        tableView.register(
            UserImagesTableViewCell.self,
            forCellReuseIdentifier: "UserImagesTableViewCell"
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extensions

/// Расширение для управления данными в ячейках
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentType[section] {
        case .images:
            return 1
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType[indexPath.section] {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileTableViewCell",
                for: indexPath
            ) as? ProfileTableViewCell
            else { return UITableViewCell() }
            let data = userData.user
            cell.backgroundColor = .white
            cell.configureWith(data: data)

            return cell
        case .actions:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ProfileActionsTableViewCell",
                for: indexPath
            ) as? ProfileActionsTableViewCell
            else { return UITableViewCell() }
            cell.backgroundColor = .white

            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "UserPostsTableViewCell",
                for: indexPath
            ) as? UserPostsTableViewCell
            else { return UITableViewCell() }
            let data = userData.userPosts
            cell.backgroundColor = .white
            cell.configureWith(data)

            return cell
        case .images:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "UserImagesTableViewCell",
                for: indexPath
            ) as? UserImagesTableViewCell
            else { return UITableViewCell() }
            let data = userData.spaceImages
            cell.backgroundColor = .white
            cell.configureWith(data: data)

            return cell
        }
    }
}

/// Расширение для установки высоти для каждого типа ячеек
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contentType[indexPath.section] {
        case .profile:
            return 190
        case .actions:
            return 50
        case .posts:
            return 90
        case .images:
            return 380
        }
    }
}
