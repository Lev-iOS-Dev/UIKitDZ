// BonusPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ekjrvnekvjn

protocol BonusPresenterProtocol {
    func dismiss()
}

class BonusPresenter {
    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }

    func onTap() {
        //  recipeCoordinator?.​pushProfile()
    }
}

extension BonusPresenter: BonusPresenterProtocol {
    func dismiss() {}
}
