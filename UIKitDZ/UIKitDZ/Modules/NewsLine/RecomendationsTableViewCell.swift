// RecomendationsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для переиспользуемой ячейки рекомендаций
final class RecomendationsTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        enum Insets {
            static let top: CGFloat = 45
            static let bottom: CGFloat = -25
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let right: CGFloat = -12
            static let height: CGFloat = 30
            static let smallHeight: CGFloat = 15
            static let shortInset: CGFloat = 8
            static let smallInset: CGFloat = 6
            static let inset: CGFloat = 12
            static let buttonWidth: CGFloat = 12
            static let buttonHeight: CGFloat = 12
            static let itemWidth: CGFloat = 40
            static let labelWidth: CGFloat = 150
        }

        enum Texts {
            static let subscribe = "Подписаться"
            static let recomendation = "Рекомендуем вам"
            static let seeAll = "Все"
        }
    }

    // MARK: - Visual Components

    private let recomendationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.recomendation
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()

    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Texts.seeAll, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 12, weight: .bold
        )
        return button
    }()

    private let scrollView = UIScrollView()
    private var contentViews: [UIView] = []

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScrollView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupScrollView() {
        recomendationLabel.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(recomendationLabel)
        contentView.addSubview(seeAllButton)
        contentView.addSubview(scrollView)
        scrollView.backgroundColor = .recomendationBackground

        NSLayoutConstraint.activate([
            recomendationLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.inset
            ),
            recomendationLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.inset
            ),
            recomendationLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            recomendationLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.smallHeight
            ),

            seeAllButton.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.inset
            ),
            seeAllButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.Insets.inset
            ),
            seeAllButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.itemWidth
            ),
            seeAllButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.smallHeight
            ),

            scrollView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.top
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: Constants.Insets.bottom
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
        ])
    }

    // MARK: - Private Methodes

    private func clearContentViews() {
        contentViews.forEach { $0.removeFromSuperview() }
        contentViews.removeAll()
    }

    private func makeContainerView() -> UIView {
        let container = UIView()
        scrollView.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        contentViews.append(container)
        return container
    }

    private func makeCloseButton(in container: UIView) -> UIButton {
        let button = UIButton()
        button.setImage(.close, for: .normal)
        container.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func configureImageView(with image: UIImage?, in container: UIView) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        container.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    private func configureLabel(with text: String, in container: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 10)
        label.textAlignment = .center
        container.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func makeSubscribeButton(in container: UIView) -> UIButton {
        let button = UIButton()
        button.setTitle(Constants.Texts.subscribe, for: .normal)
        button.backgroundColor = .subscribe
        button.titleLabel?.font = .systemFont(
            ofSize: 12, weight: .bold
        )
        button.layer.cornerRadius = 8
        container.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func layoutContentViews(
        container: UIView, closeButton: UIButton, imageView: UIImageView,
        nickNameLabel: UILabel, subscribeButton: UIButton, previousView: UIView?
    ) {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(
                equalTo: container.topAnchor,
                constant: Constants.Insets.shortInset
            ),
            closeButton.trailingAnchor.constraint(
                equalTo: container.trailingAnchor,
                constant: Constants.Insets.right
            ),
            closeButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            closeButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),

            imageView.topAnchor.constraint(
                equalTo: container.topAnchor,
                constant: Constants.Insets.smallHeight
            ),
            imageView.centerXAnchor.constraint(
                equalTo: container.centerXAnchor
            ),
            imageView.widthAnchor.constraint(
                equalTo: container.heightAnchor,
                multiplier: 0.6
            ),
            imageView.heightAnchor.constraint(
                equalTo: container.heightAnchor,
                multiplier: 0.6
            ),

            nickNameLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Constants.Insets.smallInset
            ),
            nickNameLabel.centerXAnchor.constraint(
                equalTo: container.centerXAnchor
            ),
            nickNameLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            nickNameLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),

            subscribeButton.topAnchor.constraint(
                equalTo: nickNameLabel.bottomAnchor,
                constant: Constants.Insets.smallInset
            ),
            subscribeButton.centerXAnchor.constraint(
                equalTo: container.centerXAnchor
            ),
            subscribeButton.widthAnchor.constraint(
                equalTo: container.widthAnchor,
                multiplier: 0.9
            ),
            subscribeButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            ),

            container.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        container.backgroundColor = .white
        if let previousView = previousView {
            container.leadingAnchor.constraint(
                equalTo: previousView.trailingAnchor,
                constant: Constants.Insets.leading
            ).isActive = true
        } else {
            container.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: Constants.Insets.leading
            ).isActive = true
        }
    }

    // MARK: - Public Methodes

    func configureWithData(_ recomendations: [Recomendation]) {
        clearContentViews()
        var previousView: UIView? = nil

        for recomendation in recomendations {
            let container = makeContainerView()
            let closeButton = makeCloseButton(in: container)
            let imageView = configureImageView(
                with: recomendation.profileImage, in: container
            )
            let label = configureLabel(
                with: recomendation.nickName, in: container
            )
            let subscribeButton = makeSubscribeButton(in: container)

            layoutContentViews(
                container: container,
                closeButton: closeButton,
                imageView: imageView,
                nickNameLabel: label,
                subscribeButton: subscribeButton,
                previousView: previousView
            )
            previousView = container
        }

        if let lastView = contentViews.last {
            scrollView.trailingAnchor.constraint(
                equalTo: lastView.trailingAnchor,
                constant: 10
            ).isActive = true
        }
    }
}
