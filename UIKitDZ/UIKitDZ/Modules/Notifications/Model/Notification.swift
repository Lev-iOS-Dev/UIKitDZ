// Notification.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

struct Notification {
    let photo: UIImage
    let nickName: String
    let description: String
    let notificationTime: String
    let postImage: UIImage
    let notificationType: NotificationType
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
