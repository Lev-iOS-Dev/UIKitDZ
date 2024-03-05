// CardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для отображения политики конфиденциальности
final class CardView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let title = "Terms of Use"
        static let text = """
        Welcome to our recipe app! We're thrilled to have you on board.
        To ensure a delightful experience for everyone, please take a moment to familiarize yourself with our rules:
        User Accounts:
        Maintain one account per user.
                Safeguard your login credentials; don't share them with others.
                Content Usage:
                Recipes and content are for personal use only.
                Do not redistribute or republish recipes without proper attribution.
                Respect Copyright:
                Honor the copyright of recipe authors and contributors.
                Credit the original source when adapting or modifying a recipe.
                Community Guidelines:
                Show respect in community features.
                Avoid offensive language or content that violates community standards.
                Feedback and Reviews:
                Share constructive feedback and reviews.
                Do not submit false or misleading information.
                Data Privacy:
                Review and understand our privacy policy regarding data collection and usage.
                Compliance with Laws:
                Use the app in compliance with all applicable laws and regulations.
                Updates to Terms:
                Stay informed about updates; we'll notify you of any changes.
                By using our recipe app, you agree to adhere to these rules.
                Thank you for being a part of our culinary community! Enjoy exploring and cooking up a storm!
        """
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let xButtonImageName = "xmark"
    }

    // MARK: - Visual Components

    private let panView: UIView = {
        let view = UIView()
        view.backgroundColor = .panView
        view.layer.cornerRadius = 5 / 2
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
        label.font = .systemFont(ofSize: 20)
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
        textView.backgroundColor = .lightGray
        return textView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        configureSubviews()
        setLabelText(
            title: Constants.title,
            text: Constants.text
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

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

    enum Insets {
        static let top: CGFloat = 15
    }

    private func setupPanViewConstraints() {
        NSLayoutConstraint.activate([
            panView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 15
            ),
            panView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            panView.widthAnchor.constraint(
                equalToConstant: 50
            ),
            panView.heightAnchor.constraint(
                equalToConstant: 5
            )
        ])
    }

    private func setupXbuttonConstraints() {
        NSLayoutConstraint.activate([
            xButton.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 15
            ),
            xButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            ),
            xButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 350
            ),
            xButton.widthAnchor.constraint(
                equalToConstant: 24
            ),
            xButton.heightAnchor.constraint(
                equalToConstant: 24
            )
        ])
    }

    private func setupMainLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 45
            ),
            mainLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 25
            ),
            mainLabel.heightAnchor.constraint(
                equalToConstant: 20
            )
        ])
    }

    private func setupMainTextViewConstraints() {
        NSLayoutConstraint.activate([
            mainTextView.topAnchor.constraint(
                equalTo: mainLabel.bottomAnchor,
                constant: 5
            ),
            mainTextView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 25
            ),
            mainTextView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            mainTextView.heightAnchor.constraint(
                equalTo: heightAnchor,
                constant: -150
            )
        ])
    }

    func setLabelText(title: String, text: String) {
        mainLabel.text = title
        mainTextView.text = text
    }

    @objc private func cancelTapped() {
        print("Close")
    }
}
