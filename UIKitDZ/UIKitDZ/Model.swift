// Model.swift
// Copyright © RoadMap. All rights reserved.

/// Валидатор учетных данных пользователя
struct Validator {
    // MARK: - Public Methods

    // Метод для проверки на валидность логина
    func isEmailValid(_ email: String) -> Bool {
        email.contains("@")
    }

    // Метод для проверки на валидность пароля
    func isPasswordValid(_ password: String) -> Bool {
        password == "123456"
    }
}
