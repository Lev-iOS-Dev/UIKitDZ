// ProfileActionsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Шаблон переиспользуемой ячейки для действий с профильом
final class ProfileActionsTableViewCell: UITableViewCell {
    // MARK: - Constsnts

    enum Constants {
        enum Insets {
            static let left: CGFloat = 15
            static let inset: CGFloat = 12
            static let shortInset: CGFloat = 6
            static let smallButtonWidth: CGFloat = 28
            static let buttonWidth: CGFloat = 158
            static let buttonHeight: CGFloat = 30
        }

        enum Texts {
            static let changeButonTitle = "Изменить"
            static let shareButonTitle = "Поделиться профилем"
            static let addFriendButonImage = "addFriend"
        }
    }

    let identifier = "ProfileActionsTableViewCell"

    // MARK: - Visual Component

    private lazy var changeButton = makeActionButtonWith(
        title: Constants.Texts.changeButonTitle,
        image: nil
    )
    private lazy var shareProfileButton = makeActionButtonWith(
        title: Constants.Texts.shareButonTitle,
        image: nil
    )
    private lazy var addFriendButton = makeActionButtonWith(
        title: nil,
        image: UIImage(
            named: Constants.Texts.addFriendButonImage
        )
    )

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([
            changeButton,
            shareProfileButton,
            addFriendButton
        ])
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            changeButton.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            changeButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            changeButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            changeButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),

            shareProfileButton.centerYAnchor.constraint(
                equalTo: changeButton.centerYAnchor
            ),
            shareProfileButton.leadingAnchor.constraint(
                equalTo: changeButton.trailingAnchor,
                constant: Constants.Insets.shortInset
            ),
            shareProfileButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            shareProfileButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),

            addFriendButton.centerYAnchor.constraint(
                equalTo: changeButton.centerYAnchor
            ),
            addFriendButton.leadingAnchor.constraint(
                equalTo: shareProfileButton.trailingAnchor,
                constant: Constants.Insets.shortInset
            ),
            addFriendButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.smallButtonWidth
            ),
            addFriendButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func makeActionButtonWith(
        title: String?, image: UIImage?
    ) -> UIButton {
        let button = UIButton()
        if let title = title {
            button.setTitle(title, for: .normal)
        }
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(
            ofSize: 10, weight: .bold
        )
        if let image = image {
            button.setImage(image, for: .normal)
        }
        button.backgroundColor = .actionButton
        button.titleLabel?.font = .systemFont(
            ofSize: 10, weight: .bold
        )
        return button
    }
}
