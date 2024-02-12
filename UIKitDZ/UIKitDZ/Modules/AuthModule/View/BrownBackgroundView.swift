// BrownBackgroundView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Custom view
class BrownBackgroundView: UIView {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var yLogoPosition: CGFloat
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: yLogoPosition, width: 175, height: 76))
        view.image = UIImage(named: AuthModel.logoImageName)
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

    // MARK: - Life Cycle

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setUI() {
        backgroundColor = .brownCustom
        addSubview(logoImageView)
    }
}

// private lazy var loginButton: UIButton = {
//    let button = UIButton(frame: CGRect(x: 20, y: 750, width: UIScreen.main.bounds.width - 40, height: 44))
//    button.backgroundColor = UIColor(named: "customRedColor")
//    button.layer.cornerRadius = 12
//    button.setTitle("Login", for: .normal)
//    button.setTitleColor(.white, for: .normal)
//    button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 16)
//    button.addTarget(nil, action: #selector(moveToBirthdayVC), for: .touchUpInside)
//    button.isEnabled = false
//    button.alpha = 0.5
//    return button
// }()
