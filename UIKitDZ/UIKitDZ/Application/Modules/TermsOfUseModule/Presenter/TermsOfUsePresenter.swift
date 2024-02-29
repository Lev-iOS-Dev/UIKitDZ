// TermsOfUsePresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol TermsOfUsePresenterProtocol {
    /// Обрабатывает  запрос о закрытии экрана
    func closeScreen()
    /// Загружает и обновляет текст в лейблах нашего вью
    func setLabelTexts()
}

/// Презентер для экрана с политикой конфиденциальности
final class TermsOfUsePresenter {
    // MARK: - Private Properties

    private weak var view: TermsOfUseViewControllerProtocol?
    private weak var coordinator: BaseCoodinator?
    private let termsOfUseStorage = TermsOfUseStorage()

    // MARK: - Initializers

    init(view: TermsOfUseViewControllerProtocol, coordinator: BaseCoodinator) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - TermsOfUsePresenter + TermsOfUsePresenterProtocol

extension TermsOfUsePresenter: TermsOfUsePresenterProtocol {
    func closeScreen() {
        view?.closeScreen()
    }

    func setLabelTexts() {
        let infoToPass = termsOfUseStorage.termsOfUse
        view?.setLabelText(info: infoToPass)
    }
}
