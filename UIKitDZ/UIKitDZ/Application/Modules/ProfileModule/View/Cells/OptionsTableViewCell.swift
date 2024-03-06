// OptionsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс для переиспользуемой ячейка таблицы
final class OptionsTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "OptionsTableCell"
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
    }

    // MARK: - Visual Properties

    private var optionsView: UIView = {
        let view = UIView()
        view.backgroundColor = .myLightGray
        view.layer.cornerRadius = 12
        return view
    }()

    private var optionsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var optionsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .optionsLabelText
        label.font = .myFont(fontName: Constants.verdanaFont, fontSize: 18)
        return label
    }()

    private var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .myLine
        return view
    }()

    // MARK: - Initalizers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        configureSubviews()
    }

    // MARK: - Public Methods

    func configureCell(info: ProfileOption) {
        optionsImageView.image = UIImage(named: info.optionImageName)
        optionsLabel.text = info.optionText
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubviews([optionsView, optionsLabel, lineView], prepareForAutolayout: true)
        optionsView.addSubviews([optionsImageView], prepareForAutolayout: true)
    }
    
    private func configureSubviews() {
        setupBackgroundViewConstraints()
        setupOptionsImageViewConstraints()
        setupOptionsLabelConstraints()
        setupLineViewConstraints()
    }
}

/// Расширение для установки расположений и размеров UI элементов
extension OptionsTableViewCell {
    private func setupBackgroundViewConstraints() {
        NSLayoutConstraint.activate([
            optionsView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 25
            ),
            optionsView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 15),
            optionsView.widthAnchor.constraint(
                equalToConstant: 48
            ),
            optionsView.heightAnchor.constraint(
                equalToConstant: 48
            )
        ])
    }

    private func setupOptionsImageViewConstraints() {
        NSLayoutConstraint.activate([
            optionsImageView.centerXAnchor.constraint(
                equalTo: optionsView.centerXAnchor
            ),
            optionsImageView.centerYAnchor.constraint(
                equalTo: optionsView.centerYAnchor
            ),
            optionsImageView.widthAnchor.constraint(
                equalToConstant: 28
            ),
            optionsImageView.heightAnchor.constraint(
                equalToConstant: 28
            )
        ])
    }

    private func setupOptionsLabelConstraints() {
        NSLayoutConstraint.activate([
            optionsLabel.leadingAnchor.constraint(
                equalTo: optionsView.trailingAnchor,
                constant: 16
            ),
            optionsLabel.centerYAnchor.constraint(
                equalTo: optionsView.centerYAnchor
            ),
            optionsLabel.heightAnchor.constraint(
                equalToConstant: 24
            )
        ])
    }

    private func setupLineViewConstraints() {
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(
                equalTo: optionsLabel.leadingAnchor
            ),
            lineView.topAnchor.constraint(
                equalTo: optionsLabel.bottomAnchor,
                constant: 16
            ),
            lineView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            lineView.heightAnchor.constraint(
                equalToConstant: 1
            ),
            lineView.widthAnchor.constraint(
                equalToConstant: 249
            )
        ])
    }
}
