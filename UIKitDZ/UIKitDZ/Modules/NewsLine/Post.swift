// Post.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель ячейки публикаций пользователя
struct Post {
    let avatar: UIImage
    let title: String
    let postedImages: [UIImage]
    let isLiked: Bool
    let likesCount: Int
    let description: String
}
