// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор профиля
final class ProfileCoordinator: BaseCoodinator {
    // MARK: - Public Properties

    var rootController: UINavigationController?
    var onFinishFlow: VoidHandler?

    // MARK: - Private Properties

    private let builder = AppBuilder()

    // MARK: - Public Methods

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }

    func pushTermsOfUseView() {
        let termsOfUseView = builder.makeTermsOfUseModule(coordinator: self)
        if let sheet = termsOfUseView.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        rootController?.present(termsOfUseView, animated: true)
    }

    func pushBonusView() {
        let bonusView = builder.makeBonusesModule(coordinator: self)
        if let sheet = bonusView.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 320 })]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        rootController?.present(bonusView, animated: true)
    }

    func logout() {
        onFinishFlow?()
    }
}
