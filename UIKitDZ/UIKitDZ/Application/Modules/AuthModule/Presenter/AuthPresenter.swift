// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для общения с AuthPresenter
protocol AuthPresenterProtocol: AnyObject {
    func checkValidationOf(email: String)
    func checkValidationOf(password: String)
}

/// Presenter для страницы авторизации
class AuthPresenter {
    weak var authCoordinator: AuthCoordinator?
    private weak var view: AuthViewControllerProtocol?

    init(view: AuthViewControllerProtocol) {
        self.view = view
    }

    func onTap() {}
}

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
