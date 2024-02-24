// ProfileTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для вызова функции на экране ProfileViewController
protocol ProfileTableViewCellDelegate: AnyObject {
    func didTapLinkButtonInCell(_ cell: ProfileTableViewCell)
}

/// Шаблон переиспользуемой ячейки для показа информации о пользователе
final class ProfileTableViewCell: UITableViewCell {
    // MARK: - Constsnts

    enum Constants {
        enum Insets {
            static let top: CGFloat = 22
            static let left: CGFloat = 15
            static let right: CGFloat = -15
            static let distance: CGFloat = 55
            static let height: CGFloat = 35
            static let inset: CGFloat = 12
            static let smallInset: CGFloat = 6
            static let imageWidth: CGFloat = 80
            static let imageHeight: CGFloat = 80
            static let labelWidth: CGFloat = 70
            static let labelHeight: CGFloat = 17
            static let labelLongWidth: CGFloat = 170
        }

        enum Texts {
            static let posts = "публикации"
            static let subscribers = "подписчики"
            static let subscriptions = "подписки"
            static let link = "📎 www.spacex.com"
        }
    }

    let identifier = "ProfileTableViewCell"

    // MARK: - Visual Component

    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        return imageView
    }()

    private lazy var postsInfoLabel = makeInfoLabel()
    private lazy var subscribersInfoLabel = makeInfoLabel()
    private lazy var subscriptionsInfoLabel = makeInfoLabel()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
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

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private var professionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private lazy var linkButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Texts.link, for: .normal)
        button.setTitleColor(.linkLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(
            ofSize: 14, weight: .regular
        )
        button.addTarget(
            self,
            action: #selector(didTapLinkButton(_:)),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - Public Properties
    
    weak var delegate: ProfileTableViewCellDelegate?

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
            postsInfoLabel,
            subscribersInfoLabel,
            subscriptionsInfoLabel,
            nameLabel,
            professionLabel,
            linkButton
        ])
    }

    private func configureProfileImageView() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.inset
            ),
            profileImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            profileImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.imageWidth
            ),
            profileImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.imageHeight
            )
        ])
    }

    private func configurePostsInfoLabel() {
        NSLayoutConstraint.activate([
            postsInfoLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.top
            ),
            postsInfoLabel.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: Constants.Insets.distance
            ),
            postsInfoLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            postsInfoLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configureSubscribersInfoLabel() {
        NSLayoutConstraint.activate([
            subscribersInfoLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.top
            ),
            subscribersInfoLabel.leadingAnchor.constraint(
                equalTo: postsInfoLabel.trailingAnchor,
                constant: Constants.Insets.smallInset
            ),
            subscribersInfoLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            subscribersInfoLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configureSubscriptionsInfoLabel() {
        NSLayoutConstraint.activate([
            subscriptionsInfoLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.top
            ),
            subscriptionsInfoLabel.leadingAnchor.constraint(
                equalTo: subscribersInfoLabel.trailingAnchor,
                constant: Constants.Insets.smallInset
            ),
            subscriptionsInfoLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            subscriptionsInfoLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configureNameLabel() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(
                equalTo: profileImageView.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            nameLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelLongWidth
            ),
            nameLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configureProfessionLabel() {
        NSLayoutConstraint.activate([
            professionLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            professionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            professionLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelLongWidth
            ),
            professionLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configureLinkButton() {
        NSLayoutConstraint.activate([
            linkButton.topAnchor.constraint(
                equalTo: professionLabel.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            linkButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            linkButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.Insets.right
            ),
            linkButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configureSubviews() {
        configureProfileImageView()
        configurePostsInfoLabel()
        configureSubscribersInfoLabel()
        configureSubscriptionsInfoLabel()
        configureNameLabel()
        configureProfessionLabel()
        configureLinkButton()
    }

    private func makeInfoLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }

    private func makeAttributedTextWith(
        count: Int, description: String
    ) -> NSAttributedString {
        let countFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        let output = NSMutableAttributedString(
            string: "\(count)\n",
            attributes: [.font: countFont]
        )

        let descriptionFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        let descriptionAttributed = NSMutableAttributedString(
            string: description, attributes: [.font: descriptionFont]
        )

        output.append(descriptionAttributed)

        return output
    }

    @objc private func didTapSubscribeButton(_ sender: UIButton) {
        print("didTapSubscribeButton")
    }

    @objc private func didTapLinkButton(_ sender: UIButton) {
        self.delegate?.didTapLinkButtonInCell(self)
    }

    // MARK: - Public Methodes

    func configureWith(data: User) {
        profileImageView.image = data.profileImage
        postsInfoLabel.attributedText = makeAttributedTextWith(
            count: data.postsCount,
            description: Constants.Texts.posts
        )
        subscribersInfoLabel.attributedText = makeAttributedTextWith(
            count: data.subscribersCount,
            description: Constants.Texts.subscribers
        )
        subscriptionsInfoLabel.attributedText = makeAttributedTextWith(
            count: data.postsCount,
            description: Constants.Texts.subscriptions
        )
        nameLabel.text = data.name
        professionLabel.text = data.profession
    }
}
