// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор профиля
final class ProfileCoordinator: BaseCoodinator {
    // MARK: - Constants

    enum Constants {
        static let bonusViewSize: CGFloat = 320
        static let cornerRadius: CGFloat = 20
    }

    // MARK: - Public Properties

    var rootController: UINavigationController?
    var onFinishFlow: VoidHandler?

    // MARK: - Private Properties

    private let builder = AppBuilder()

    // MARK: - Public Methods

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }

    func pushBonusView() {
        let bonusView = builder.makeBonusesModule(coordinator: self)
        if let sheet = bonusView.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in Constants.bonusViewSize })]
            sheet.preferredCornerRadius = Constants.cornerRadius
            sheet.prefersGrabberVisible = true
        }
        rootController?.present(bonusView, animated: true)
    }

    func logout() {
        onFinishFlow?()
    }
}
