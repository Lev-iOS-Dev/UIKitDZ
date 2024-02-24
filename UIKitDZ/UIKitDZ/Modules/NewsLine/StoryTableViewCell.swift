// StoryTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для переиспользуемой ячейки для показа историй
final class StoryTableViewCell: UITableViewCell {
    // MARK: - Constsnts

    enum Constants {
        enum Insets {
            static let top: CGFloat = 9
        }
    }

    let identifier = "StoryTableViewCell"

    // MARK: - Visual Component

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

    // MARK: - Private Methodes

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            )
        ])
    }

    func configureWith(_ data: [Story]) {
        contentViews.forEach { $0.removeFromSuperview() }
        contentViews.removeAll()

        var previousView: UIView? = nil
        for story in data {
            let container = UIView()
            scrollView.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false

            let imageView = UIImageView(image: story.photo)
            imageView.contentMode = .scaleAspectFit
            container.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false

            let label = UILabel()
            label.text = story.nickName
            label.font = .systemFont(ofSize: 8)
            label.textAlignment = .center
            container.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(
                    equalTo: container.topAnchor
                ),
                imageView.leadingAnchor.constraint(
                    equalTo: container.leadingAnchor
                ),
                imageView.trailingAnchor.constraint(
                    equalTo: container.trailingAnchor
                ),
                imageView.heightAnchor.constraint(
                    equalTo: container.heightAnchor,
                    multiplier: 0.8
                ),

                label.topAnchor.constraint(
                    equalTo: imageView.bottomAnchor
                ),
                label.bottomAnchor.constraint(
                    equalTo: container.bottomAnchor
                ),
                label.leadingAnchor.constraint(
                    equalTo: container.leadingAnchor
                ),
                label.trailingAnchor.constraint(
                    equalTo: container.trailingAnchor
                ),

                container.heightAnchor.constraint(
                    equalTo: scrollView.heightAnchor
                ),
                container.widthAnchor.constraint(
                    equalTo: scrollView.heightAnchor
                )

            ])

            if let previousView = previousView {
                container.leadingAnchor.constraint(
                    equalTo: previousView.trailingAnchor,
                    constant: 10
                ).isActive = true
            } else {
                container.leadingAnchor.constraint(
                    equalTo: scrollView.leadingAnchor,
                    constant: 10
                ).isActive = true
            }

            previousView = container
            contentViews.append(container)
        }

        if let lastView = contentViews.last {
            scrollView.trailingAnchor.constraint(
                equalTo: lastView.trailingAnchor,
                constant: 10
            ).isActive = true
        }
    }
}
