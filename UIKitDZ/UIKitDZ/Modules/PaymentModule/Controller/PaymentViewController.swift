// PaymentViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Payment details screen
class PaymentViewController: UIViewController {
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
        return textField
    }()

    private lazy var okButton = GreenButtonView(
        title: "Подтвердить",
        parent: self.view,
        action: #selector(navigateToPaymentCompleteVC),
        isEnabled: true
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        configureSubViews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .systemBackground
        view.addSubViews(instructionLabel, codeTextField, okButton)
    }

    private func configureSubViews() {
        title = "Кодъ из СМС"
    }

    @objc private func navigateToPaymentCompleteVC() {
        let paymentCompleteVC = PaymentCompleteViewController()
        paymentCompleteVC.modalPresentationStyle = .fullScreen
        present(paymentCompleteVC, animated: true)
    }
}
