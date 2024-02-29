// BonusPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия c презентером
protocol BonusPresenterProtocol {
    /// Сообщает вью, что нужно закрыть экран
    func closeScreen()
    /// Устанавливает новый текст в лейбле вью
    func setBonusesLabelText()
}

final class BonusPresenter {
    // MARK: - Private Properties

    private weak var view: BonusViewControllerProtocol?
    private let bonusStorage = BonusStorage()

    // MARK: - Initializers

    init(view: BonusViewControllerProtocol) {
        self.view = view
    }
}

extension BonusPresenter: BonusPresenterProtocol {
    func closeScreen() {
        view?.closeScreen()
    }

    func setBonusesLabelText() {
        view?.setBonusesCount(count: bonusStorage.bonusInfo.bonusesCount)
    }
}
