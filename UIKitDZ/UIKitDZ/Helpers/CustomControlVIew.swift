// CustomControlVIew.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомный контрол
final class CustomControlView: UIControl {
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
