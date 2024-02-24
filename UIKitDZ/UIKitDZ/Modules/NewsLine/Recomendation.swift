// Recomendation.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель ячейки для рекомендаций на подписку
struct Recomendation {
    // Фотография рекомендуемого пользователя
    let profileImage: UIImage
    // Имя или ник рекомендуемого пользователя
    let nickName: String
    // Меняется на true после нажатия кнопки Подписатся
    let isSubscribed: Bool
}
