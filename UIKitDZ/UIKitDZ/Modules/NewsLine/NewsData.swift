// NewsData.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для хранения внешних данных / заменяет бек
struct NewsData {
    let stories: [Story] = [
        Story(
            nickName: "Ваша история",
            photo: .selfy,
            isViewed: false
        ),
        Story(
            nickName: "Astala Bastala",
            photo: .profileImage1,
            isViewed: false
        ),
        Story(
            nickName: "Chigo Kango",
            photo: .profileImage2,
            isViewed: false
        ),
        Story(
            nickName: "Morva Anula",
            photo: .profileImage3,
            isViewed: false
        ),
        Story(
            nickName: "Somu Numalo",
            photo: .profileImage4,
            isViewed: false
        )
    ]

    let posts: [Post] = [
        Post(
            avatar: .avatar,
            title: "tur_v_dagestan1",
            postedImages: [.post, .post, .post, .post],
            isLiked: false,
            likesCount: 201,
            description: "tur_v_dagestan Насладитесь красотой природы. Забронировать\nтур в Дагестан можно уже сейчас!"
        ),
        Post(
            avatar: .avatar,
            title: "tur_v_dagestan2",
            postedImages: [.post],
            isLiked: false,
            likesCount: 201,
            description: "tur_v_dagestan Насладитесь красотой природы. Забронировать\nтур в Дагестан можно уже сейчас!"
        ),
        Post(
            avatar: .avatar,
            title: "tur_v_dagestan3",
            postedImages: [.post, .post, .post],
            isLiked: false,
            likesCount: 201,
            description: "tur_v_dagestan Насладитесь красотой природы. Забронировать\nтур в Дагестан можно уже сейчас!"
        ),
        Post(
            avatar: .avatar,
            title: "tur_v_dagestan4",
            postedImages: [.post, .post],
            isLiked: false,
            likesCount: 201,
            description: "tur_v_dagestan Насладитесь красотой природы. Забронировать\nтур в Дагестан можно уже сейчас!"
        )
    ]

    let recomendations: [Recomendation] = [
        Recomendation(
            profileImage: .recomendedProfile1,
            nickName: "сrimea_082",
            isSubscribed: false
        ),
        Recomendation(
            profileImage: .recomendedProfile2,
            nickName: "mary_pol",
            isSubscribed: false
        )
    ]
}
