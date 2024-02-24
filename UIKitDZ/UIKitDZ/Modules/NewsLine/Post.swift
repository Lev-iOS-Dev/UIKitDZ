// Post.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель ячейки публикаций пользователя
struct Post {
    
    // маленькая фотография автора поста
    let avatar: UIImage
    // заголовка для поста
    let title: String
    // фотография/ии которые опубликовал автор
    let postedImages: [UIImage]
    // нажата ли кнопка нравится (сердечко)
    let isLiked: Bool
    // количество поставленных лайков
    let likesCount: Int
    // описание для публикации
    let description: String
}
