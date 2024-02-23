// NotificationData.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

struct NotificationData {
    let notifications: [Notification] = [
        Notification(
            photo: .profileImage1,
            nickName: "Solonia Asuloesta",
            description: "понравился ваш \nкомментарий: 'Очень красиво!'",
            notificationTime: "5ч",
            postImage: .notificationPost,
            notificationType: .newComment,
            notificationDate: .today
        ),
        Notification(
            photo: .profileImage2,
            nickName: "Antonio Banderas",
            description: "появился(-ась) в RMLink. Вы можете быть знакомы",
            notificationTime: "4ч",
            postImage: .notificationPost,
            notificationType: .newFriend,
            notificationDate: .lastWeek
        ),
        Notification(
            photo: .profileImage3,
            nickName: "Ato Kobalo",
            description: "появился(-ась) в RMLink. Вы можете быть знакомы",
            notificationTime: "4ч",
            postImage: .notificationPost,
            notificationType: .newFriend,
            notificationDate: .today
        ),
        Notification(
            photo: .profileImage4,
            nickName: "Sonio Bantero",
            description: "появился(-ась) в RMLink. Вы можете быть знакомы",
            notificationTime: "4ч",
            postImage: .notificationPost,
            notificationType: .newComment,
            notificationDate: .lastWeek
        ),
        Notification(
            photo: .profileImage4,
            nickName: "Staka Aswinger",
            description: "появился(-ась) в RMLink. Вы можете быть знакомы",
            notificationTime: "4ч",
            postImage: .notificationPost2,
            notificationType: .newFriend,
            notificationDate: .today
        )
    ]
}
