// MenuView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to choose dishes
final class MenuView: UIView {
    // MARK: - Private Properties

    private let labelText: String
    private let imageName: String
    private let yPosition: CGFloat
    private lazy var dishImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 272, y: 5, width: 70, height: 70))
        view.image = UIImage(named: imageName)
        return view
    }()

    private lazy var dishNameLabel: UILabel = {
        let label = UILabel()
        label.text = labelText
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 20, y: 31)
        return label
    }()

    // MARK: - Initializers

    init(labelText: String, imageName: String, yPosition: CGFloat) {
        self.labelText = labelText
        self.imageName = imageName
        self.yPosition = yPosition
        let frame = CGRect(x: 20, y: yPosition, width: 355, height: 80)
        super.init(frame: frame)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        backgroundColor = .brownLightCustom2
        // addSubViews(dishImageView, dishNameLabel)
        layer.cornerRadius = 16
        addSubview(dishNameLabel)
        addSubview(dishImageView)
    }
}
