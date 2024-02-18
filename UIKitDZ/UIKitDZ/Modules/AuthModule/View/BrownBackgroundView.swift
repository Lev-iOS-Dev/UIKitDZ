// BrownBackgroundView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View with brown background + logo label
final class BrownBackgroundView: UIView {
    // MARK: - Constants

    private let logoImageName = "logo"
    private let labelWidth: CGFloat = 175
    private let logoHeight: CGFloat = 76

    // MARK: - Visual Components

    private lazy var logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: yLogoPosition, width: labelWidth, height: logoHeight))
        view.image = UIImage(named: logoImageName)
        view.center.x = center.x
        return view
    }()

    // MARK: - Private Properties

    private var yLogoPosition: CGFloat

    // MARK: - Initializers

    init(frame: CGRect, yLogoPosition: CGFloat) {
        self.yLogoPosition = yLogoPosition
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = .brownApp
        addSubview(logoImageView)
    }
}
