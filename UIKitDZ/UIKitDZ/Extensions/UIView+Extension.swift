// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение для удобство добавления сабвьюшек ко вью через запятую
///  и одновременно отключение "translatesAutoresizingMaskIntoConstraints"
public extension UIView {
    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutolayout($0) : $0) }
    }
}

