// CategoriesCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Переиспользуемая ячейка для показа категорий
final class CategoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let CornerRadius: CGFloat = 16
        }

        enum Texts {}
    }

    // MARK: - Visual Components

    private let shadowContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.cornerRadius = Constants.Insets.CornerRadius
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.Insets.CornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .categoryNameBackground.withAlphaComponent(0.82)
        label.layer.cornerRadius = Constants.Insets.CornerRadius
        label.layer.masksToBounds = true
        label.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        return label
    }()

    // MARK: - Public Properties

    let identifier = "CategoriesCollectionViewCell"

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        configureLayout()
        setupShadowContainer()
        setupContentView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([
            shadowContainerView,
            imageView,
            nameLabel
        ])
    }

    private func configureLayout() {
        configureShadowContainerViewConstraints()
        configureImageViewConstraints()
        configureNameLabelConstraints()
    }

    private func setupContentView() {
        contentView.sendSubviewToBack(shadowContainerView)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = Constants.Insets.CornerRadius
    }

    private func setupShadowContainer() {
        let shadowContainer = UIView(frame: CGRect.zero)
        shadowContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shadowContainer)
        sendSubviewToBack(shadowContainer)
    }

    // MARK: - Configuration

    func configureWith(imageName: String, name: String) {
        imageView.image = UIImage(named: imageName)
        nameLabel.text = name
    }
}

/// Pасширение для устоновки размеров и расположения элементов
extension CategoriesCollectionViewCell {
    private func configureShadowContainerViewConstraints() {
        NSLayoutConstraint.activate([
            shadowContainerView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            shadowContainerView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            shadowContainerView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            shadowContainerView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
        ])
    }

    private func configureImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            imageView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),
            imageView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor
            ),
            imageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }

    private func configureNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            nameLabel.heightAnchor.constraint(
                equalTo: contentView.heightAnchor,
                multiplier: 0.2
            )
        ])
    }
}
