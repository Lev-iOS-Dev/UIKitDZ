// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор профиля
final class ProfileCoordinator: BaseCoodinator {
    // MARK: - Public Properties

    var rootController: UINavigationController
    var onFinishFlow: (() -> ())?

    // MARK: - Private Properties

    let builder = AppBuilder()

    // MARK: - Initializers

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    // MARK: - Public Methods

    func ​pushTermsOfUse() {
        let termsOfUseView = builder.makeTermsOfUseModule()
        if let sheet = termsOfUseView.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        rootController.present(termsOfUseView, animated: true)
    }

    func pushBonusView() {
        let bonusView = builder.makeBonusesModule()
        if let sheet = bonusView.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        rootController.present(bonusView, animated: true)
    }

    func logout() {
        onFinishFlow?()
    }
}
