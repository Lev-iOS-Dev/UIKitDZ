// MakeMessageStackView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Функция для создания переиспользуемого stackView для показа об отсутствии каких то данных
public func makeMessageStackView(
    image: UIImage,
    title: String,
    message: String
) -> UIStackView {
    enum Fonts {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
    }

    lazy var messageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15
        stackView.isHidden = true

        stackView.addArrangedSubviews([
            imageView,
            titleLabel,
            messageLabel
        ])
        return stackView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = title
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(
            name: Fonts.verdanaBoldFont,
            size: 18
        )
        return label
    }()

    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = message
        label.textColor = .myMessageLabel
        label.textAlignment = .center
        label.font = UIFont(
            name: Fonts.verdanaFont,
            size: 13
        )
        return label
    }()

    return messageStackView
}
