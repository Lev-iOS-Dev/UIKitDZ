// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с AuthPresenter
protocol AuthPresenterProtocol: AnyObject {
    /// Проверяем на валидность почту
    func checkEmailValidation(of email: String)
    /// Проверяем на валидность пароль
    func checkPasswordValidation(of password: String)
    /// Проверяем на валидность пользователя с данными email и password
    func checkCredentials(of email: String, password: String)
    /// Просим координатора сделать переход на главный экран
    func moveToMain()
}

/// Presenter для страницы авторизации
final class AuthPresenter {
    // MARK: - Private Properties

    private weak var authCoordinator: AuthCoordinator?
    private weak var view: AuthViewControllerProtocol?
    private let validator = Validator()

    // MARK: - Initializers

    init(view: AuthViewControllerProtocol, coordinator: AuthCoordinator) {
        self.view = view
        authCoordinator = coordinator
    }
}

// MARK: - AuthPresenter + AuthPresenterProtocol

extension AuthPresenter: AuthPresenterProtocol {
    func moveToMain() {
        authCoordinator?.moveToMain()
    }

    func checkEmailValidation(of email: String) {
        let isValid = validator.isEmailValid(email)
        view?.updateUIForEmail(isValid: isValid)
    }

    func checkPasswordValidation(of password: String) {
        let isValid = validator.isPasswordValid(password)
        view?.updateUIForPassword(isValid: isValid)
    }

    func checkCredentials(of email: String, password: String) {
        let isValid = validator.isEmailAndPasswordCorrect(
            email: email,
            password: password
        )
        view?.checkCredentials(isValid: isValid)
    }
}
