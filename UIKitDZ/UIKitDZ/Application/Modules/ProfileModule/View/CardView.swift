// CardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для отображения политики конфиденциальности
final class CardView: UIView {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let top: CGFloat = 15
            static let littleTop: CGFloat = 5
            static let leading: CGFloat = 25
            static let trailing: CGFloat = -10
            static let panViewCornerRadius: CGFloat = 5 / 2
            static let panViewWidth: CGFloat = 50
            static let panViewHeight: CGFloat = 5
            static let mainLabelHeight: CGFloat = 20
            static let xButtonSize: CGFloat = 24
        }

        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let xButtonImageName = "xmark"
    }

    // MARK: - Visual Components

    private let panView: UIView = {
        let view = UIView()
        view.backgroundColor = .panView
        view.layer.cornerRadius = Constants.Insets.panViewCornerRadius
        return view
    }()

    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.setImage(
            UIImage(systemName: Constants.xButtonImageName),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(cancelTapped),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = .myFont(fontName: Constants.verdanaBoldFont, fontSize: 20)
        label.textAlignment = .left
        return label
    }()

    private lazy var mainTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.textAlignment = .left
        textView.showsVerticalScrollIndicator = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 14)
        return textView
    }()

    // MARK: - Private Properties

    private weak var viewController: ProfileViewController?

    // MARK: - Initializers

    init(frame: CGRect, viewController: ProfileViewController) {
        super.init(frame: frame)
        self.viewController = viewController
        configureSelf()
        setupSubviews()
        configureSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

    private func configureSelf() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        isUserInteractionEnabled = true
    }

    private func setupSubviews() {
        addSubviews([
            panView,
            xButton,
            mainLabel,
            mainTextView
        ])
    }

    private func configureSubviews() {
        setupPanViewConstraints()
        setupXbuttonConstraints()
        setupMainLabelConstraints()
        setupMainTextViewConstraints()
    }

    func setLabelText(title: String, text: String) {
        mainLabel.text = title
        mainTextView.text = text
    }

    @objc private func cancelTapped() {
        removeFromSuperview()
        viewController?.navigationController?.navigationBar.isHidden = false
        viewController?.tabBarController?.tabBar.isHidden = false
    }
}

/// Расширение для установки расположений и размеров UI элементов
extension CardView {
    private func setupPanViewConstraints() {
        NSLayoutConstraint.activate([
            panView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Insets.top
            ),
            panView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            panView.widthAnchor.constraint(
                equalToConstant: Constants.Insets.panViewWidth
            ),
            panView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.panViewHeight
            )
        ])
    }

    private func setupXbuttonConstraints() {
        NSLayoutConstraint.activate([
            xButton.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constants.Insets.top
            ),
            xButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            xButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 350
            ),
            xButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.xButtonSize
            ),
            xButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.xButtonSize
            )
        ])
    }

    private func setupMainLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(
                equalTo: xButton.bottomAnchor,
                constant: Constants.Insets.top
            ),
            mainLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Insets.leading
            ),
            mainLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.mainLabelHeight
            )
        ])
    }

    private func setupMainTextViewConstraints() {
        NSLayoutConstraint.activate([
            mainTextView.topAnchor.constraint(
                equalTo: mainLabel.bottomAnchor,
                constant: Constants.Insets.littleTop
            ),
            mainTextView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.Insets.leading
            ),
            mainTextView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            )
        ])
    }
}
