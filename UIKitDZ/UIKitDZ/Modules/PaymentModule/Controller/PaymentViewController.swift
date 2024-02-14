// PaymentViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Payment details screen
final class PaymentViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var instructionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 146, width: view.frame.width - 60, height: 45))
        label.text = "Введите кодъ изъ смс, чтобы подтвердить оплату"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

    private lazy var codeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 60,
            y: 217,
            width: UIScreen.main.bounds.width - 120,
            height: 44
        ))
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.font = UIFont(name: "Verdana-bold", size: 18)
        textField.delegate = self
        return textField
    }()

    private lazy var confirmationButton = GreenButtonView(
        title: "Подтвердить",
        parent: self.view,
        action: #selector(navigateToPaymentCompleteVC),
        isEnabled: false
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        configureSubViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBackButton()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .systemBackground
        view.addSubViews(instructionLabel, codeTextField, confirmationButton)
    }

    private func configureSubViews() {
        title = "Кодъ из СМС"
        codeTextField.becomeFirstResponder()
    }

    private func configureBackButton() {
        let backImage = UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: backImage,
            style: .plain,
            target: self,
            action: #selector(backButtonAction)
        )
    }

    @objc private func navigateToPaymentCompleteVC() {
        let paymentCompleteVC = PaymentCompleteViewController()
        paymentCompleteVC.modalPresentationStyle = .fullScreen
        present(paymentCompleteVC, animated: true)
    }

    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension PaymentViewController: UITextFieldDelegate {
    // Check code length show/hide corresponding UI
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let additionalValue = (string.isEmpty) ? -1 : 1
        let codeLength = (codeTextField.text?.count ?? 0) + additionalValue
        guard codeLength > 0 else {
            confirmationButton.isEnabled = false
            return true
        }
        confirmationButton.isEnabled = true
        return true
    }
}
