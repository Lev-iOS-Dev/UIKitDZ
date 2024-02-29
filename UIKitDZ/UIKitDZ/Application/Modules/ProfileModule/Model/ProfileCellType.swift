// ProfileCellType.swift
// Copyright © RoadMap. All rights reserved.

/// Типы ячеек для экрана профиля
enum ProfileCellType {
    /// Кейс для секции с именем пользователя и аватара
    case userInfo
    /// Кейс для секции с бонусами
    case bonuses
    /// Кейс для секции с политикой конфиденциальности
    case privacy
    /// Кейс для выхода из учетной записи
    case logout

    static func fetchCellTypes() -> [ProfileCellType] {
        [.userInfo, .bonuses, .privacy, .logout]
    }
}
