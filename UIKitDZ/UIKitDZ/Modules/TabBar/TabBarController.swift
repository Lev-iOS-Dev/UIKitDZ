// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class TabBarController: UITabBarController {
    // MARK: - Constants

    enum Titles {
        static let newsLine = "Лента"
        static let notifications = "Уведомления"
        static let profile = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        let newsLineViewController = UINavigationController(
            rootViewController: NewsLineViewController()
        )
        let newsLineItem = UITabBarItem(
            title: Titles.newsLine,
            image: .newslineIcon,
            tag: 0
        )

        let notificationsViewController = UINavigationController(
            rootViewController: NotificationsViewController()
        )
        let notificationsItem = UITabBarItem(
            title: Titles.notifications,
            image: .notificationIcon,
            tag: 1
        )

        let profileViewController = UINavigationController(
            rootViewController: ProfileViewController()
        )
        let profileItem = UITabBarItem(
            title: Titles.profile,
            image: .profileIcon,
            tag: 2
        )

        newsLineViewController.tabBarItem = newsLineItem
        notificationsViewController.tabBarItem = notificationsItem
        profileViewController.tabBarItem = profileItem

        viewControllers = [
            newsLineViewController,
            notificationsViewController,
            profileViewController
        ]
    }
}
