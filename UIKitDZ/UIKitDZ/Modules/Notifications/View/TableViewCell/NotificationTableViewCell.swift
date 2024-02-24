// NotificationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class NotificationTableViewCell: UITableViewCell {
    // MARK: - Constsnts

    enum Constants {
        enum Insets {
            static let right: CGFloat = -12
            static let height: CGFloat = 30
            static let shortInset: CGFloat = 6
            static let imageWidth: CGFloat = 40
            static let imageHeight: CGFloat = 40
            static let buttonWidth: CGFloat = 150
        }

        enum Texts {
            static let subscribeButonTitle = "Подписаться"
        }
    }

    let identifier = "NotificationTableViewCell"

    // MARK: - Visual Component

    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        return imageView
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Texts.subscribeButonTitle, for: .normal)
        button.backgroundColor = .subscribe
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(
            ofSize: 10, weight: .bold
        )
        button.addTarget(
            self,
            action: #selector(didTapSubscribeButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

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
            profileImageView,
            descriptionLabel,
            subscribeButton,
            postImageView
        ])
    }

    private func configureProfileImageView() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.shortInset
            ),
            profileImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.shortInset
            ),
            profileImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.imageWidth
            ),
            profileImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.imageHeight
            )
        ])
    }

    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(
                equalTo: profileImageView.centerYAnchor
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: Constants.Insets.shortInset
            ),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: 55
            ),
            descriptionLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: subscribeButton.leadingAnchor,
                constant: -Constants.Insets.shortInset
            ),
            descriptionLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: postImageView.leadingAnchor,
                constant: -Constants.Insets.shortInset
            )
        ])
    }

    private func configureSubscribeButton() {
        NSLayoutConstraint.activate([
            subscribeButton.centerYAnchor.constraint(
                equalTo: profileImageView.centerYAnchor
            ),
            subscribeButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.Insets.right
            ),
            subscribeButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            subscribeButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configurePostImageView() {
        NSLayoutConstraint.activate([
            postImageView.centerYAnchor.constraint(
                equalTo: profileImageView.centerYAnchor
            ),

            postImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.Insets.right
            ),
            postImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.imageWidth
            ),
            postImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.imageHeight
            )
        ])
    }

    private func configureSubviews() {
        configureProfileImageView()
        configureDescriptionLabel()
        configureSubscribeButton()
        configurePostImageView()
    }

    private func makeFullDescriptionFrom(
        nickName: String,
        description: String,
        notificationTime: String
    ) -> NSMutableAttributedString {
        let nickNameFont = UIFont.systemFont(ofSize: 12, weight: .bold)
        let output = NSMutableAttributedString(
            string: nickName,
            attributes: [.font: nickNameFont]
        )

        let regularFont = UIFont.systemFont(ofSize: 12, weight: .regular)

        let descriptionAttributed = NSMutableAttributedString(
            string: description,
            attributes: [.font: regularFont]
        )

        let notificationTimeAttributed = NSMutableAttributedString(
            string: notificationTime,
            attributes: [
                .font: regularFont,
                .foregroundColor: UIColor.comment
            ]
        )

        let spaceAttributed = NSMutableAttributedString(
            string: " ",
            attributes: [.font: regularFont]
        )

        output.append(spaceAttributed)
        output.append(descriptionAttributed)
        output.append(spaceAttributed)
        output.append(notificationTimeAttributed)
        return output
    }

    @objc private func didTapSubscribeButton(_ sender: UIButton) {
        print("didTapSubscribeButton")
    }

    // MARK: - Public Methodes

    func configureWith(data: Notification) {
        profileImageView.image = data.photo
        descriptionLabel.attributedText = makeFullDescriptionFrom(
            nickName: data.nickName,
            description: data.description,
            notificationTime: data.notificationTime
        )
        subscribeButton.isHidden = data.notificationType == .newComment
        postImageView.image = data.postImage
        postImageView.isHidden = data.notificationType == .newFriend
    }
}
