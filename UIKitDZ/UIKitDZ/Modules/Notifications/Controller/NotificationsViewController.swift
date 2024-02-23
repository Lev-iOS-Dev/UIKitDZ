// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница для показа новых уведомлений и подписок
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum Insets {
            static let top: CGFloat = 12
            static let left: CGFloat = 12
            static let smallHeight: CGFloat = 15
            static let labelWidth: CGFloat = 150
            static let labelHeight: CGFloat = 17
        }

        enum Texts {
            static let subscribingRequests = "Запросы на подписку"
        }
    }

    private let contentType: [ContentType] = [
        .today, .lastWeek
    ]

    enum ContentType {
        case today
        case lastWeek
    }

    private let notificationData = NotificationData()

    // MARK: - Visual Components

    private let subscribingRequestsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.subscribingRequests
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

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
            subscribingRequestsLabel,
            tableView
        ])
        view.backgroundColor = .white
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            subscribingRequestsLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            subscribingRequestsLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            subscribingRequestsLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            subscribingRequestsLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            ),

            tableView.topAnchor.constraint(
                equalTo: subscribingRequestsLabel.bottomAnchor,
                constant: Constants.Insets.top
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

    private func configureTableView() {
        title = "Уведомления"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(
            NotificationTableViewCell.self,
            forCellReuseIdentifier: "NotificationTableViewCell"
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
}

/// Расширение для управления данными в ячейках
extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch contentType[section] {
        case .today:
            return "Сегодня"
        case .lastWeek:
            return "На этой неделе"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        contentType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch contentType[section] {
        case .today:
            return notificationData.notifications
                .filter { $0.notificationDate == .today }.count
        case .lastWeek:
            return notificationData.notifications
                .filter { $0.notificationDate == .lastWeek }.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch contentType[indexPath.section] {
        case .today:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationTableViewCell",
                for: indexPath
            ) as? NotificationTableViewCell
            else { return UITableViewCell() }
            let data = notificationData.notifications
                .filter { $0.notificationDate == .today }
            cell.configureWith(data: data[indexPath.row])

            return cell
        case .lastWeek:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationTableViewCell",
                for: indexPath
            ) as? NotificationTableViewCell
            else { return UITableViewCell() }
            let data = notificationData.notifications
                .filter { $0.notificationDate == .lastWeek }
            cell.configureWith(data: data[indexPath.row])

            return cell
        }
    }
}

/// Расширение для установки высоти для каждого типа ячеек
extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
