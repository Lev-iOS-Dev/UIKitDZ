// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с AuthPresenter
protocol AuthPresenterProtocol: AnyObject {
    var authCoordinator: AuthCoordinator? { get set }
    func checkValidationOf(email: String)
    func checkValidationOf(password: String)
}

/// Presenter для страницы авторизации
final class AuthPresenter {
    // MARK: - Public Propeties

    weak var authCoordinator: AuthCoordinator?

    // MARK: - Private Properties

    private weak var view: AuthViewControllerProtocol?

    // MARK: - Initializers

    init(view: AuthViewControllerProtocol) {
        self.view = view
    }
}

// MARK: - AuthPresenter + AuthPresenterProtocol

extension AuthPresenter: AuthPresenterProtocol {
    func checkValidationOf(email: String) {
        let isValid = !email.contains("@")
        view?.updateUIForEmail(isValid: isValid)
    }

    func checkValidationOf(password: String) {
        let isValid = password == "123456"
        view?.updateUIForPassword(isValid: isValid)
    }
}
