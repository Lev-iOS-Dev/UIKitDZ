// UIView+AddSubviews.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение для добавления subviews через запятую
///  и одновременно отключающая translatesAutoresizingMaskIntoConstraints
public extension UIView {
    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutolayout($0) : $0) }
    }
}
