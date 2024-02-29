// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение для более удобного добавление subviews к view
///  плюс отключение translatesAutoresizingMaskIntoConstraints
public extension UIView {
    /// метод добавляет subviews ко вью, и отключает для них translatesAutoresizingMaskIntoConstraints
    /// - Parameter  views: массив добавляемых вью
    /// - Parameter  needToPrepare: булевое значение для выбора отключить или нет
    /// translatesAutoresizingMaskIntoConstraints

    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutoLayout($0) : $0) }
    }
}
