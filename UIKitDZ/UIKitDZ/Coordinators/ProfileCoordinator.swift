// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор профиля
final class ProfileCoordinator: BaseCoodinator {
    var rootController: UINavigationController
    var onFinishFlow: (() -> Void)?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    func ​pushTermsOfUse() {
        let termsOfUseVC = TermsOfUseViewController()
        rootController.pushViewController(termsOfUseVC, animated: true)
    }

    func logout() {
        onFinishFlow?()
    }

    func pushBonusView() {
        let bonusView = BonusViewController()
        if let sheet = bonusView.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        rootController.present(bonusView, animated: true)
    }
}
