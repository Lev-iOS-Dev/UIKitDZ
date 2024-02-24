// ImageCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Переиспользуемая ячейка для показа изображений
final class ImageCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants

    let identifier = "ImageCollectionViewCell"

    // MARK: - Visual Components

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        configureLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([
            imageView
        ])
    }

    private func configureLayout() {
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

    // MARK: - Configuration

    func configureWith(image: UIImage) {
        imageView.image = image
    }
}
