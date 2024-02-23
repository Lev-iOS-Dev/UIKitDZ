// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

public extension UIView {
    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutolayout($0) : $0) }
    }
}
