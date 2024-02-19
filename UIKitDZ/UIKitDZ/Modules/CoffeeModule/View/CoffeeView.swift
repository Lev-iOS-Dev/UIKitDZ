// CoffeeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для модификации
final class ModificationView: UIView {
    var imageName: String
    var descriptionText: String
    var coordinates: (x: Int, y: Int)
    var gesture: UIGestureRecognizer
    var imageView = UIImageView()
    var descriptionLabel = UILabel()

    init(
        imageName: String,
        descriptionText: String,
        coordinates: (x: Int, y: Int),
        gesture: UIGestureRecognizer
    ) {
        self.imageName = imageName
        self.descriptionText = descriptionText
        self.coordinates = coordinates
        self.gesture = gesture
        super.init(frame: CGRect(
            x: coordinates.x,
            y: coordinates.y,
            width: 165,
            height: 165
        ))
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = UIColor(hex: "#F7F7F7")
        layer.cornerRadius = 12

        imageView = UIImageView(frame: CGRect(
            x: 30, y: 15, width: 100, height: 100
        ))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .center

        descriptionLabel = UILabel(frame: CGRect(
            x: 0, y: 117, width: frame.width, height: 34
        ))
        descriptionLabel.text = descriptionText
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0

        addSubview(imageView)
        addSubview(descriptionLabel)
        addGestureRecognizer(gesture)

        updateInfo()
    }

    func updateInfo() {
        imageView.image = UIImage(named: imageName)
        descriptionLabel.text = descriptionText
    }
}
