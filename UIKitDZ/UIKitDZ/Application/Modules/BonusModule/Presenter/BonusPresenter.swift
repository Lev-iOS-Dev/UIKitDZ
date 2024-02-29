// BonusPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия c презентером
protocol BonusPresenterProtocol {
    /// Сообщает вью, что нужно закрыть экран
    func closeScreen()
    /// Устанавливает новый текст в лейбле вью
    func fetchBonuses()
}

/// Презентер для экрана с бонусов
final class BonusPresenter {
    // MARK: - Private Properties

    private weak var view: BonusViewControllerProtocol?
    private weak var coordinator: BaseCoodinator?
    private let bonusStorage = BonusStorage()

    // MARK: - Initializers

    init(view: BonusViewControllerProtocol, coordinator: BaseCoodinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - BonusPresenter + BonusPresenterProtocol

extension BonusPresenter: BonusPresenterProtocol {
    func closeScreen() {
        view?.closeScreen()
    }

    func fetchBonuses() {
        view?.setBonusesCount(count: bonusStorage.bonusInfo.bonusesCount)
    }
}
