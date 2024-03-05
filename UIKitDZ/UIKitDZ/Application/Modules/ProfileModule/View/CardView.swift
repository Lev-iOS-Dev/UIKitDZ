// CardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

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
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 14)
        return textView
    }()

    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.xButtonImageName), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Properties

    //        var presenter: TermsOfUsePresenterProtocol?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setupSubviews()
        setupMainLabelConstraints()
        setupMainTextViewConstraints()
        setupXbuttonConstraints()
        setLabelText(
            title: Constants.title,
            text: Constants.text
        )
        isUserInteractionEnabled = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        addSubviews([mainLabel, mainTextView, xButton], prepareForAutolayout: true)
    }

    private func setupMainLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            mainLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupMainTextViewConstraints() {
        NSLayoutConstraint.activate([
            mainTextView.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            mainTextView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            mainTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            mainTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupXbuttonConstraints() {
        NSLayoutConstraint.activate([
            xButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            xButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            xButton.widthAnchor.constraint(equalToConstant: 24),
            xButton.heightAnchor.constraint(equalToConstant: 24)
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
