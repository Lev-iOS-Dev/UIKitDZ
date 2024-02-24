// Story.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель ячейки сторисов
struct Story {
    // Имя или ник найм пользователя опубликовавщего сторис
    let nickName: String
    // Фотография пользователя опубликовавщего сторис
    let photo: UIImage
    // Меняется на true когда смотрим данный сторис
    let isViewed: Bool
}
