// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ekjrvnekvjn
class ProfilePresenter {
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

    // MARK: - Public Properties

    func onTapTermsOfUse() {
        profileCoordinator?.​pushTermsOfUse()
    }
}
