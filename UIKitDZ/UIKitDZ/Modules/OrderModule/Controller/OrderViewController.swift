// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Order details screen
final class OrderViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let dismissButton = "dismissButton"
    }

    // MARK: - View Components

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.dismissButton), for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapDismissButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private var leftImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "leftImage")
        return view
    }()

    private var rightImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rightImage")
        return view
    }()

    private var orderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#111111")
        label.text = "Вашъ Заказъ"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private lazy var americanoLabel = makeLabelWithText(
        "Американо", alignement: .left
    )
    private lazy var milkLabel = makeLabelWithText(
        "Молоко", alignement: .left
    )
    private lazy var espressoLabel = makeLabelWithText(
        "Эспрессо 50мл", alignement: .left
    )
    private lazy var americanoPriceLabel = makeLabelWithText(
        "100 руб", alignement: .right
    )
    private lazy var milkPriceLabel = makeLabelWithText(
        "50 руб", alignement: .right
    )
    private lazy var espressoPriceLabel = makeLabelWithText(
        "50 руб", alignement: .right
    )

    private var orderPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#111111")
        label.text = "Цѣна - 200 руб"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private var middleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "middleImage")
        return view
    }()

    private lazy var payButton = MintColorBottomButton(
        title: "Оплатить",
        parent: self.view,
        action: #selector(didTapPayButton(_:)),
        isEnabled: true
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        configureSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePrice()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .white
        view.addSubViews(
            dismissButton,
            leftImageView,
            rightImageView,
            orderLabel,
            americanoLabel,
            milkLabel,
            espressoLabel,
            americanoPriceLabel,
            milkPriceLabel,
            espressoPriceLabel,
            orderPriceLabel,
            middleImageView,
            payButton
        )
    }

    private func configureSubviews() {
        dismissButton.frame = CGRect(x: 15, y: 21, width: 24, height: 24)
        leftImageView.frame = CGRect(x: 20, y: 48, width: 100, height: 73)
        rightImageView.frame = CGRect(x: 260, y: 48, width: 100, height: 73)
        orderLabel.frame = CGRect(x: 120, y: 100, width: 140, height: 30)
        americanoLabel.frame = CGRect(x: 20, y: 155, width: 150, height: 30)
        milkLabel.frame = CGRect(x: 20, y: 191, width: 150, height: 30)
        espressoLabel.frame = CGRect(x: 20, y: 227, width: 150, height: 30)
        americanoPriceLabel.frame = CGRect(x: 225, y: 155, width: 130, height: 30)
        milkPriceLabel.frame = CGRect(x: 225, y: 191, width: 130, height: 30)
        espressoPriceLabel.frame = CGRect(x: 225, y: 227, width: 130, height: 30)
        orderPriceLabel.frame = CGRect(x: 80, y: 499, width: 231, height: 30)
        middleImageView.frame = CGRect(x: 145, y: 538, width: 100, height: 40)
        payButton.frame = CGRect(x: 20, y: 632, width: 345, height: 44)
    }

    func updatePrice() {
        let price = CoffeeViewController.currentPrice
        orderPriceLabel.text = "Цѣна - \(price) руб"
    }

    private func makeLabelWithText(_ text: String, alignement: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = alignement
        return label
    }

    @objc private func didTapDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @objc private func didTapPayButton(_ sender: UIButton) {

    }
}
