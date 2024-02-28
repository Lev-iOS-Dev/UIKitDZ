// UserInfoTableCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class UserInfoTableCell: UITableViewCell {
    // MARK: - Types

    typealias BlankHandler = () -> ()

    // MARK: - Constants

    enum Constants {
        static let identifier = "UserInfoTableCell"

        enum Texts {
            static let verdanaFont = "Verdana"
            static let verdanaBoldFont = "Verdana-Bold"
        }

        enum ImagesNames {
            static let pencilImageName = "pencil"
        }
    }

    // MARK: - Visual Components

    private var profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ProfileStorage.Constants.avatarImageName)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var profileImageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Texts.verdanaBoldFont, size: 25)
        label.text = ProfileStorage.Constants.defaultUsername
        label.numberOfLines = 0
        label.textColor = .optionsLabelText
        label.textAlignment = .center
        return label
    }()

    private lazy var pencilButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: Constants.ImagesNames.pencilImageName), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .myDarkText
        button.addTarget(self, action: #selector(pencilButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    var showAlert: BlankHandler?

    // MARK: - Initalizers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupProfileAvatarImageConstraints()
        setupNameLabelConstraints()
        setupPencilButtonConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupProfileAvatarImageConstraints()
        setupNameLabelConstraints()
        setupPencilButtonConstraints()
    }

    // MARK: - Public Methods

    func configureCell(info: UserInfo) {
        profileAvatarImageView.image = UIImage(named: info.imageName)
        profileImageLabel.text = info.username
    }

    func changeUserName(text: String) {
        profileImageLabel.text = text
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([profileAvatarImageView, profileImageLabel, pencilButton], prepareForAutolayout: true)
    }

    private func setupProfileAvatarImageConstraints() {
        NSLayoutConstraint.activate([
            profileAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            profileAvatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileAvatarImageView.widthAnchor.constraint(equalToConstant: 160),
            profileAvatarImageView.heightAnchor.constraint(equalToConstant: 160),
        ])
    }

    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            profileImageLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor, constant: 26),
            profileImageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageLabel.heightAnchor.constraint(equalToConstant: 30),
            profileImageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -29)
        ])
    }

    private func setupPencilButtonConstraints() {
        NSLayoutConstraint.activate([
            pencilButton.leadingAnchor.constraint(equalTo: profileImageLabel.trailingAnchor, constant: 8),
            pencilButton.topAnchor.constraint(equalTo: profileImageLabel.topAnchor, constant: 3),
            pencilButton.centerYAnchor.constraint(equalTo: profileImageLabel.centerYAnchor),
            pencilButton.widthAnchor.constraint(equalToConstant: 24),
            pencilButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }

    @objc private func pencilButtonTapped() {
        print("tapped")
        showAlert?()
    }
}
