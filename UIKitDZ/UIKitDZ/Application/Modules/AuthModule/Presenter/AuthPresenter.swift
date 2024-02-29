// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с AuthPresenter
protocol AuthPresenterProtocol: AnyObject {
    /// Проверяем на валидность почту
    func checkValidationOf(email: String)
    /// Проверяем на валидность пароль
    func checkValidationOf(password: String)
}

/// Presenter для страницы авторизации
final class AuthPresenter {
    // MARK: - Private Properties

    private weak var authCoordinator: AuthCoordinator?
    private weak var view: AuthViewControllerProtocol?

    // MARK: - Initializers

    init(view: AuthViewControllerProtocol, coordinator: AuthCoordinator) {
        self.view = view
        authCoordinator = coordinator
    }
}

// MARK: - AuthPresenter + AuthPresenterProtocol

extension AuthPresenter: AuthPresenterProtocol {
    func checkValidationOf(email: String) {
        let isValid = email.contains("@") && email.contains(".")
        view?.updateUIForEmail(isValid: isValid)
    }

    func checkValidationOf(password: String) {
        let isValid = password == "123456"
        view?.updateUIForPassword(isValid: isValid)
    }
}
