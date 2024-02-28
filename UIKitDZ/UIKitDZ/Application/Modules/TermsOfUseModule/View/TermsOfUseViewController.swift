// TermsOfUseViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер
class TermsOfUseViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
        static let xButtonImageName = "xmark"
    }

    // MARK: - Visual Components

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 20)
        label.textAlignment = .left
        label.text = termsOfUseStorage.termsOfUse.title
        return label
    }()

    private lazy var mainTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.textAlignment = .left
        textView.showsVerticalScrollIndicator = false
        textView.isEditable = false
        textView.font = UIFont(name: Constants.verdanaFont, size: 14)
        textView.text = termsOfUseStorage.termsOfUse.text
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

    let termsOfUseStorage = TermsOfUseStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupMainLabelConstraints()
        setupMainTextViewConstraints()
        setupXbuttonConstraints()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([mainLabel, mainTextView, xButton], prepareForAutolayout: true)
    }

    private func setupMainLabelConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            mainLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupMainTextViewConstraints() {
        NSLayoutConstraint.activate([
            mainTextView.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            mainTextView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            mainTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            mainTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupXbuttonConstraints() {
        NSLayoutConstraint.activate([
            xButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            xButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            xButton.widthAnchor.constraint(equalToConstant: 24),
            xButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc private func cancelTapped() {
        dismiss(animated: true)
    }
}
