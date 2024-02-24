// UserData.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных заменяющий бек
struct UserData {
    let user = User(
        profileImage: .selfy,
        name: "Мария Иванова",
        profession: "Консультант",
        postsCount: 67,
        subscribersCount: 458,
        subscriptionsCount: 120
    )

    let userPosts: [UserPost] = [
        UserPost(image: .space1, description: "Запуск"),
        UserPost(image: .space2, description: "Космонавт"),
        UserPost(image: .space3, description: "Космос"),
        UserPost(image: .moon, description: "Луна"),
        UserPost(image: .space1, description: "Запуск"),
        UserPost(image: .space2, description: "Космонавт"),
        UserPost(image: .space3, description: "Космос"),
        UserPost(image: .moon, description: "Луна")
    ]

    let spaceImages: [SpaceImage] = [
        SpaceImage(image: .collViewImage1),
        SpaceImage(image: .collViewImage2),
        SpaceImage(image: .collViewImage3),
        SpaceImage(image: .collViewImage4),
        SpaceImage(image: .collViewImage5),
        SpaceImage(image: .collViewImage6),
        SpaceImage(image: .collViewImage1),
        SpaceImage(image: .collViewImage2),
        SpaceImage(image: .collViewImage3)
    ]
}
