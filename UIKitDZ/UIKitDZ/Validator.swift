// Validator.swift
// Copyright © RoadMap. All rights reserved.

/// Валидатор учетных данных пользователя
struct Validator {
    // MARK: - Public Methods

    let validations = ValidationStorage().validations

    // Метод для проверки на валидность логина
    func isEmailValid(_ email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }

    // Метод для проверки на валидность пароля
    func isPasswordValid(_ password: String) -> Bool {
        password == "123456"
    }

    func isEmailAndPasswordCorrect(email: String, password: String) -> Bool {
        let requiredValidation = Validation(
            email: email,
            password: password
        )
        if validations.contains(where: { validation in
            validation.email == requiredValidation.email &&
                validation.password == requiredValidation.password
        }) {
            return true
        } else {
            return false
        }
    }
}
