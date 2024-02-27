// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ekjrvnekvjn
class ProfilePresenter {
    weak var profileCoordinator: ProfileCoordinator?

    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }

    func onTapTermsOfUse() {
        profileCoordinator?.​pushTermsOfUse()
    }
}
