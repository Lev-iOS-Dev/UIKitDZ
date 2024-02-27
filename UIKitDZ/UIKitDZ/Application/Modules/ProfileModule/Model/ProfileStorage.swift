// ProfileStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

struct ProfileStorage {
    // MARK: - Constants

    enum Constants {
        static let avatarImageName = "profileAvatarImage"
        static let defaultUsername = "Surname Name"
    }

    // Данные для заполнения ячейки с информацией о пользователе
    let userInfo = UserInfo(imageName: Constants.avatarImageName, username: Constants.defaultUsername)
}
