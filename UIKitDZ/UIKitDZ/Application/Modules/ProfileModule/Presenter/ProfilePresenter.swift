// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ekjrvnekvjn
class ProfilePresenter {
    // MARK: - Types

    // MARK: - Public Properties

    weak var profileCoordinator: ProfileCoordinator?
    let cellTypes: [ProfileCellTypes] = [.userInfo, .bonuses, .privacy, .logout]
    let profileStorage = ProfileStorage()

    // MARK: - Private Properties

    private weak var view: UIViewController?

    // MARK: - Initializers

    init(view: UIViewController) {
        self.view = view
    }

    // MARK: - Public Methods

    func onTapTermsOfUse() {
        profileCoordinator?.​pushTermsOfUse()
    }

    func pushBonusView() {
        profileCoordinator?.pushBonusView()
    }

    func showNameChangeAlert() {
        guard let profileViewController = view as? ProfileViewController else { return }
        profileViewController.showNameChangeAlert()
    }

    func showLogoutAlert() {
        guard let profileViewController = view as? ProfileViewController else { return }
        profileViewController.showLogoutAlert()
    }

    func logout() {
        profileCoordinator?.logout()
    }
}
