// UIStackView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение для добавления subviews в stackView через запятую
///  и одновременно отключающая translatesAutoresizingMaskIntoConstraints
public extension UIStackView {
    func addArrangedSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addArrangedSubview(needToPrepare ? prepareForAutolayout($0) : $0) }
    }
}
