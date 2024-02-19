//
//  AddPersonViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

/// Экран для добавления новых дней рождений
class AddBirthDayViewController: UIViewController {
    // MARK: - Constants
    let genderOptions = ["Male", "Female"]
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
    private let datePicker = UIDatePicker()
    private let pickerView = UIPickerView()
    // MARK: - Private properties
    private weak var activeTextField: UITextField?
    private var selectedValue: String?
    private var selectedGender: String?
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
        setupDatePicker()
        setupPickerView()
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
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
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
        textField.delegate = self
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
    private func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        ageTextField.inputView = pickerView
        genderTextField.inputView = pickerView
        pickerView.backgroundColor = .white
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let okButton = UIBarButtonItem(
            title: "Ок", style: .done, target: self,
            action: #selector(self.pickerViewDismiss))
        toolBar.setItems([okButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        ageTextField.inputAccessoryView = toolBar
        genderTextField.inputAccessoryView = toolBar
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
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func pickerViewDismiss(_ sender: UIButton) {
        if activeTextField == genderTextField {
            self.genderTextField.text = selectedGender
        } else if activeTextField == ageTextField {
            self.ageTextField.text = selectedValue
        }
        view.endEditing(true)
    }
}
/// Расширение для услежки за текстовыми полями
extension AddBirthDayViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing")
        if textField == telegramTextField {
            showTelegramAlert()
        }
        activeTextField = textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
/// Расширение для показа календаря для выбора даты рождения
extension AddBirthDayViewController {
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.backgroundColor = UIColor(hex: "#f5f6f5")
        datePicker.addTarget(self,
            action: #selector(datePickerValueChanged),
            for: .valueChanged)
        birthDayTextField.delegate = self
        birthDayTextField.inputView = datePicker
    }

    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM.yyyy"
        birthDayTextField.text = dateFormatter.string(from: datePicker.date)
        birthDayTextField.resignFirstResponder()
    }
}
/// Расширение для показа алерт контроллера
extension AddBirthDayViewController {
    private func showTelegramAlert() {
        let telegramAlert = UIAlertController(
            title: "Please enter Telegram",
            message: nil,
            preferredStyle: .alert
        )
        telegramAlert.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(
            title: "Ok", style: .default) { _ in
                if let alertTextFieldText = telegramAlert.textFields?.first?.text {
                    self.telegramTextField.text = alertTextFieldText
                }
            }
        telegramAlert.addAction(cancelAction)
        telegramAlert.addAction(okAction)
        self.present(telegramAlert, animated: true)
    }
}
/// расширение для настроек пикер вью
extension AddBirthDayViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        activeTextField == genderTextField ? 2 : 100
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch activeTextField {
        case ageTextField:
            selectedValue = "\(row + 1)"
            return selectedValue
        case genderTextField:
            selectedGender = genderOptions[row]
            return selectedGender
        default:
            return ""
        }
    }
}
