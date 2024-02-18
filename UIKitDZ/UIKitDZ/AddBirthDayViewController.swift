//
//  AddPersonViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

/// Экран для добавления новых дней рождений
class AddBirthDayViewController: UIViewController {
    // MARK: - Visual Components
    private let newProfileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile_default")
        return view
    }()
    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(
            .systemBlue, for: .normal)
        button.setTitle("Change Photo", for: .normal)
        button.titleLabel?.font = .systemFont(
            ofSize: 16, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(didTapChangePhotoButton(_:)),
                         for: .touchUpInside)
        return button
    }()
    private var fullNameLabel = UILabel()
    private var fullNameTextField = UITextField()
    private var fullNameLineView = UIView()
    private var birthDayLabel = UILabel()
    private var birthDayTextField = UITextField()
    private var birthDayLineView = UIView()
    private var ageLabel = UILabel()
    private var ageTextField = UITextField()
    private var ageLineView = UIView()
    private var genderLabel = UILabel()
    private var genderTextField = UITextField()
    private var genderLineView = UIView()
    private var telegramLabel = UILabel()
    private var telegramTextField = UITextField()
    private var telegramLineView = UIView()
    // MARK: - Private properties
    private weak var activeTextField: UITextField?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialSetup()
        setupSubviews()
        configureInfoLabels()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureSubviews()
    }
    // MARK: - Private Methods
    private func setupSubviews() {
        view.addSubviews([
            newProfileImageView,
            changePhotoButton
        ])
    }
    private func configureSubviews() {
        newProfileImageView.frame = CGRect(
            x: 125, y: 66, width: 125, height: 125)
        changePhotoButton.frame = CGRect(
            x: 125, y: 200, width: 125, height: 20)
    }
    private func configureInfoLabels() {
        fullNameLabel = makeTitleLabel(
            text: "Name Surname", originY: 307)
        fullNameTextField = makeTextFieldWith(
            placeholderText: "Typing Name Surname", originY: 336)
        fullNameLineView = makeLineView(originY: 361)
        birthDayLabel = makeTitleLabel(
            text: "Birthday", originY: 382)
        birthDayTextField = makeTextFieldWith(
            placeholderText: "Typing Date of Birth", originY: 411)
        birthDayLineView = makeLineView(originY: 436)
        ageLabel = makeTitleLabel(
            text: "Age", originY: 457)
        ageTextField = makeTextFieldWith(
            placeholderText: "Typing age", originY: 486)
        ageLineView = makeLineView(originY: 511)
        genderLabel = makeTitleLabel(
            text: "Gender", originY: 530)
        genderTextField = makeTextFieldWith(
            placeholderText: "Indicate Gender", originY: 559)
        genderLineView = makeLineView(originY: 584)
        telegramLabel = makeTitleLabel(
            text: "Telegram", originY: 605)
        telegramTextField = makeTextFieldWith(
            placeholderText: "Typing Telegram", originY: 634)
        telegramLineView = makeLineView(originY: 659)
    }
    private func makeInitialSetup() {
        view.backgroundColor = .white
        let cancellButton = UIBarButtonItem(
            title: "Cancel", style: .plain,
            target: self, action: #selector(didTapCancelButton))
        let addButton = UIBarButtonItem(
            title: "Add", style: .plain,
            target: self, action: #selector(didTapAddButton))
        navigationItem.leftBarButtonItem = cancellButton
        navigationItem.rightBarButtonItem = addButton
    }
    private func makeTitleLabel(text: String, originY: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#111111")
        label.frame = CGRect(x: 20, y: originY, width: 175, height: 19)
        view.addSubview(label)
        return label
    }
    private func makeTextFieldWith(placeholderText: String, originY: CGFloat) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholderText
        textField.font = .systemFont(ofSize: 14)
        textField.frame = CGRect(x: 20, y: originY, width: 250, height: 17)
        view.addSubview(textField)
        return textField
    }
    private func makeLineView(originY: CGFloat) -> UIView {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hex: "#D0D6DC")
        lineView.frame = CGRect(x: 20, y: originY, width: 361, height: 2)
        view.addSubview(lineView)
        return lineView
    }
    @objc func didTapCancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    @objc func didTapAddButton(_ sender: UIBarButtonItem) {
        print("didTapAddButton")
    }
    @objc func didTapChangePhotoButton(_ sender: UIButton) {
        print("didTapChangePhotoButton")
    }
}
