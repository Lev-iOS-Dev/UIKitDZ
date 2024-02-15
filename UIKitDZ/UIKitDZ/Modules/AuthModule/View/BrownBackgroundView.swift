// BrownBackgroundView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Custom view
final class BrownBackgroundView: UIView {
    // MARK: - Private Properties

    private var yLogoPosition: CGFloat
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(
            x: 0, y: yLogoPosition, width: 175, height: 76
        ))
        view.image = UIImage(named: Auth.logoImageName)
        view.center.x = center.x
        return view
    }()

    // MARK: - Initializers

    init(frame: CGRect, yLogoPosition: CGFloat) {
        self.yLogoPosition = yLogoPosition
        super.init(frame: frame)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        backgroundColor = .brownCustom
        addSubview(logoImageView)
    }
}
