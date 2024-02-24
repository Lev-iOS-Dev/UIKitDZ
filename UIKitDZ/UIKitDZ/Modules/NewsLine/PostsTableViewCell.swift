// PostsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для переиспользуемой ячейки пыбликаций
final class PostsTableViewCell: UITableViewCell {
    // MARK: - Constsnts

    enum Constants {
        enum Insets {
            static let top: CGFloat = 12
            static let left: CGFloat = 12
            static let right: CGFloat = -12
            static let smallHeight: CGFloat = 15
            static let height: CGFloat = 30
            static let shortInset: CGFloat = 6
            static let inset: CGFloat = 12
            static let buttonWidth: CGFloat = 22
            static let buttonHeight: CGFloat = 22
            static let labelWidth: CGFloat = 150
        }

        enum Texts {
            static let likesCount = "Нравится: 0"
            static let comment = "Комментировать ..."
            static let postTime = "10 минут назад"
        }
    }
    
    let identifier = "PostsTableViewCell"

    // MARK: - Visual Component

    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        return imageView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()

    private lazy var overflowButton: UIButton = {
        let button = UIButton()
        button.setImage(.overflow, for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapOverflowButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var imagesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .comment
        return pageControl
    }()

    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(.heart, for: .normal)
        button.tintColor = .black
        button.addTarget(
            self,
            action: #selector(didTapLikeButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(.comment, for: .normal)
        return button
    }()

    private var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(.share, for: .normal)
        return button
    }()

    private var flagButton: UIButton = {
        let button = UIButton()
        button.setImage(.flag, for: .normal)
        return button
    }()

    private var likesCountLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.likesCount
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    private var commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .selfy
        return imageView
    }()

    private var commentLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.comment
        label.textColor = .comment
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    private var postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.postTime
        label.textColor = .comment
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    // MARK: - Private Properties

    private var likeButtonState: LikeButtonStates = .notSelected

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
            avatarImageView,
            titleLabel,
            overflowButton,
            imagesScrollView,
            likeButton,
            commentButton,
            shareButton,
            pageControl,
            flagButton,
            likesCountLabel,
            descriptionLabel,
            commentImageView,
            commentLabel,
            postTimeLabel
        ])
    }

    private func configureAvatarImageView() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.Insets.top
            ),
            avatarImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            avatarImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.height
            ),
            avatarImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configureTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(
                equalTo: avatarImageView.centerYAnchor
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: Constants.Insets.shortInset
            ),
            titleLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            titleLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configureOverflowButton() {
        NSLayoutConstraint.activate([
            overflowButton.centerYAnchor.constraint(
                equalTo: avatarImageView.centerYAnchor
            ),
            overflowButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.Insets.right
            ),
            overflowButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            overflowButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configureImagesScrollView() {
        NSLayoutConstraint.activate([
            imagesScrollView.topAnchor.constraint(
                equalTo: avatarImageView.bottomAnchor,
                constant: Constants.Insets.top
            ),
            imagesScrollView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            imagesScrollView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            imagesScrollView.heightAnchor.constraint(
                equalToConstant: 240
            )
        ])
    }

    private func configureLikeButton() {
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(
                equalTo: imagesScrollView.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            likeButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            likeButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            likeButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configureCommentButton() {
        NSLayoutConstraint.activate([
            commentButton.topAnchor.constraint(
                equalTo: imagesScrollView.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            commentButton.leadingAnchor.constraint(
                equalTo: likeButton.trailingAnchor,
                constant: Constants.Insets.inset
            ),
            commentButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            commentButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configureShareButton() {
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(
                equalTo: imagesScrollView.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            shareButton.leadingAnchor.constraint(
                equalTo: commentButton.trailingAnchor,
                constant: Constants.Insets.inset
            ),
            shareButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            shareButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configurePageControl() {
        NSLayoutConstraint.activate([
            pageControl.centerYAnchor.constraint(
                equalTo: likeButton.centerYAnchor
            ),
            pageControl.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            )
        ])
    }

    private func configureFlagButton() {
        NSLayoutConstraint.activate([
            flagButton.topAnchor.constraint(
                equalTo: imagesScrollView.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            flagButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.Insets.right
            ),
            flagButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            flagButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configureLikesCountLabel() {
        NSLayoutConstraint.activate([
            likesCountLabel.topAnchor.constraint(
                equalTo: likeButton.bottomAnchor,
                constant: Constants.Insets.shortInset
            ),
            likesCountLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            likesCountLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            likesCountLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.smallHeight
            )
        ])
    }

    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: likesCountLabel.bottomAnchor,
                constant: Constants.Insets.shortInset
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: Constants.Insets.right
            ),
            descriptionLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            )
        ])
    }

    private func configureCommentImageView() {
        NSLayoutConstraint.activate([
            commentImageView.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.Insets.shortInset
            ),
            commentImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            commentImageView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            commentImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configureCommentLabel() {
        NSLayoutConstraint.activate([
            commentLabel.centerYAnchor.constraint(
                equalTo: commentImageView.centerYAnchor
            ),
            commentLabel.leadingAnchor.constraint(
                equalTo: commentImageView.trailingAnchor,
                constant: Constants.Insets.shortInset
            ),
            commentLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            commentLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.smallHeight
            )
        ])
    }

    private func configurePostTimeLabel() {
        NSLayoutConstraint.activate([
            postTimeLabel.topAnchor.constraint(
                equalTo: commentImageView.bottomAnchor,
                constant: Constants.Insets.shortInset
            ),
            postTimeLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.Insets.left
            ),
            postTimeLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.labelWidth
            ),
            postTimeLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.smallHeight
            )
        ])
    }

    private func configureSubviews() {
        configureAvatarImageView()
        configureTitleLabel()
        configureOverflowButton()
        configureImagesScrollView()
        configureLikeButton()
        configureCommentButton()
        configureShareButton()
        configurePageControl()
        configureFlagButton()
        configureLikesCountLabel()
        configureDescriptionLabel()
        configureCommentImageView()
        configureCommentLabel()
        configurePostTimeLabel()
    }

    private func likeButtonStateToggle() {
        switch likeButtonState {
        case .selected:
            setupLikeButtonWith(state: .notSelected)
        case .notSelected:
            setupLikeButtonWith(state: .selected)
        }
    }

    private func setupLikeButtonWith(state: LikeButtonStates) {
        switch state {
        case .selected:
            likeButtonState = .selected
            likeButton.setImage(.heartFill, for: .normal)
        case .notSelected:
            likeButtonState = .notSelected
            likeButton.setImage(.heart, for: .normal)
        }
    }

    private func makeSubviews(data: Post) {
        let screenWidth = UIScreen.main.bounds.width
        for (index, image) in data.postedImages.enumerated() {
            let imageView = UIImageView()
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imagesScrollView.addSubview(imageView)

            let leadingInset = CGFloat(index) * screenWidth
            imageView.leadingAnchor.constraint(
                equalTo: imagesScrollView.leadingAnchor,
                constant: leadingInset
            )
            .isActive = true
            imageView.topAnchor.constraint(
                equalTo: imagesScrollView.topAnchor
            ).isActive = true
            imageView.bottomAnchor.constraint(
                equalTo: imagesScrollView.bottomAnchor
            ).isActive = true
            imageView.widthAnchor.constraint(
                equalToConstant: screenWidth
            ).isActive = true
            imageView.heightAnchor.constraint(
                equalTo: imageView.widthAnchor,
                multiplier: 0.6
            ).isActive = true
            if index == data.postedImages.count - 1 {
                imageView.trailingAnchor.constraint(
                    equalTo: imagesScrollView.trailingAnchor
                ).isActive = true
            }
        }
    }

    @objc private func didTapLikeButton(_ sender: UIButton) {
        likeButtonStateToggle()
    }

    @objc private func didTapOverflowButton(_ sender: UIButton) {
        print("didTapOverflowButton")
    }

    // MARK: - Public Methodes

    func configureWith(data: Post) {
        avatarImageView.image = data.avatar
        titleLabel.text = data.title
        postImageView.image = data.postedImages[0]
        makeSubviews(data: data)
        pageControl.numberOfPages = data.postedImages.count
        let state: LikeButtonStates = data.isLiked ? .selected : .notSelected
        setupLikeButtonWith(state: state)
        likesCountLabel.text = "Нравится: \(data.likesCount)"
        descriptionLabel.text = data.description
    }
}

// MARK: - Extensions

/// Расширение для возможностьи менять состояние кнопки нравится
extension PostsTableViewCell {
    enum LikeButtonStates {
        case selected
        case notSelected
    }
}

extension PostsTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
