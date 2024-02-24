// User.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель ячейки информации о пользователе
struct User {
    
    // Фотография профиля пользователя
    let profileImage: UIImage
    // Имя или ник пользователя
    let name: String
    // Профессия пользователя
    let profession: String
    // Количество сделанных публикаций пользователя
    let postsCount: Int
    // Количество пользователей подпысанних на пользователя
    let subscribersCount: Int
    // Количество пользователей на которых подпысан пользователь
    let subscriptionsCount: Int
}
