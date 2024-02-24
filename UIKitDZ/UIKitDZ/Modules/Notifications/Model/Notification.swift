// Notification.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

struct Notification {
    // Фотография пользователя от которого есть уведомления
    let photo: UIImage
    // Имя или ник пользователя от которого есть уведомления
    let nickName: String
    // Описание уведомления
    let description: String
    // Время получения уведомления
    let notificationTime: String
    // Фотография публикации которую прокоментировали
    // или поставили лайк
    let postImage: UIImage
    // Показывает что за уведомление
    let notificationType: NotificationType
    // Разделяет на сегоднешные и за прошлую неделю
    let notificationDate: NotificationDate
}

enum NotificationType {
    case newComment
    case newFriend
}

enum NotificationDate {
    case today
    case lastWeek
}
