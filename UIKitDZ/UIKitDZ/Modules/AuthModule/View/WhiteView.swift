// WhiteView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Custom view
final class WhiteView: UIView {
    // MARK: - Initializers

    init(parent view: UIView, height: CGFloat = 564) {
        let frame = CGRect(x: 0, y: view.frame.height - height, width: view.frame.width, height: height)
        super.init(frame: frame)
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
