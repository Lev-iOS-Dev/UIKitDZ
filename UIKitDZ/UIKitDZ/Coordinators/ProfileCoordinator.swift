// ProfileCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор профиля
final class ProfileCoordinator: BaseCoodinator {
    var rootController: UINavigationController
    var onFinishFlow: (() -> Void)?
    var onTermsOfUse: (() -> Void)?

    init(rootController: UIViewController) {
        self.rootController = UINavigationController(rootViewController: rootController)
    }

    func ​pushTermsOfUse() {
        let termsOfUseVC = TermsOfUseViewController()
        rootController.pushViewController(termsOfUseVC, animated: true)
    }
}
