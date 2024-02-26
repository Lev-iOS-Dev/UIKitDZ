// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение для более удобного добавление subviews к view
///  плюс отключение translatesAutoresizingMaskIntoConstraints
public extension UIView {
    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutoLayout($0) : $0) }
    }
}
