// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

struct ProfileStorage {
    // MARK: - Constants

    enum Constants {
        static let avatarImageName = "profileAvatarImage"
        static let defaultUsername = "Surname Name"
        static let bonusesImageName = "starImage"
        static let privacyImageName = "paperImage"
        static let logoutImageName = "logoutImage"
        static let bonusesText = "Bonuses"
        static let privacyText = "Terms & Privacy Policy"
        static let logoutText = "Log out"
    }

    // Данные для заполнения ячейки с информацией о пользователе
    let userInfo = UserInfo(imageName: Constants.avatarImageName, username: Constants.defaultUsername)

    // Данные для ячейки с бонусами
    let bonuses =
        ProfileOption(optionImageName: Constants.bonusesImageName, optionText: Constants.bonusesText)

    // Данные для ячейки с политикой конфиденциальности
    let privacy = ProfileOption(optionImageName: Constants.privacyImageName, optionText: Constants.privacyText)

    // Данные для ячейки с бонусами
    let logout = ProfileOption(optionImageName: Constants.logoutImageName, optionText: Constants.logoutText)
}
