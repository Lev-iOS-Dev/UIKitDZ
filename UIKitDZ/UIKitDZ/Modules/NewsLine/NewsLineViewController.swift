// NewsLineViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница для показа новых постов и рекомендаций
final class NewsLineViewController: UIViewController {
    // MARK: - Constants

    private let newsData = NewsData()
    private let contentType: [ContentType] = [
        .stories, .firstPost, .recommendations, .posts
    ]
    enum Constants {
        enum Images {
            static let rmLinkLogo = "RMLink"
            static let messageIcon = "message"
        }
    }

    enum ContentType {
        case stories
        case firstPost
        case recommendations
        case posts
    }

    // MARK: - Visual Components

    private let tableView = UITableView()

    // MARK: - Live Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        configureSubviews()
        configureNavigationItem()
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
                equalTo: view.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }

    private func configureNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            customView: UIImageView(image: .rmLink)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            customView: UIImageView(image: .message)
        )
    }

    private func configureTableView() {
        tableView.register(
            StoryTableViewCell.self,
            forCellReuseIdentifier: "StoryTableViewCell"
        )
        tableView.register(
            PostsTableViewCell.self,
            forCellReuseIdentifier: "PostsTableViewCell"
        )
        tableView.register(
            RecomendationsTableViewCell.self,
            forCellReuseIdentifier: "RecomendationsTableViewCell"
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
}

/// Расширение для управления данными в ячейках
extension NewsLineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        contentType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentType[section] {
        case .stories, .firstPost, .recommendations:
            return 1
        case .posts:
            return newsData.posts.count - 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType[indexPath.section] {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "StoryTableViewCell",
                for: indexPath
            ) as? StoryTableViewCell
            else {
                return UITableViewCell()
            }
            cell.configureWith(newsData.stories)
            cell.backgroundColor = .white

            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PostsTableViewCell",
                for: indexPath
            ) as? PostsTableViewCell
            else {
                return UITableViewCell()
            }
            cell.backgroundColor = .white
            cell.configureWith(data: newsData.posts[0])
            return cell
        case .recommendations:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecomendationsTableViewCell",
                for: indexPath
            ) as? RecomendationsTableViewCell
            else {
                return UITableViewCell()
            }
            cell.backgroundColor = .recomendationBackground
            cell.configureWithData(newsData.recomendations)
            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PostsTableViewCell",
                for: indexPath
            ) as? PostsTableViewCell
            else {
                return UITableViewCell()
            }
            cell.backgroundColor = .white
            cell.configureWith(data: newsData.posts[indexPath.row + 1])

            return cell
        }
    }
}

/// Расширение для установки высоти для каждого типа ячеек
extension NewsLineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch contentType[indexPath.section] {
        case .stories:
            return 80
        case .firstPost, .posts:
            return 450
        case .recommendations:
            return 270
        }
    }
}
