// PaymentViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Payment details screen
class PaymentViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var promoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 392, width: view.frame.width - 60, height: 90))
        label.text = """
        Разскажи о насъ другу, отправь ему промокодъ на безплатный напитокъ и получи скидку 10% на слѣдующій заказъ.
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = .gray
        return label
    }()

    private lazy var okButton = GreenButtonView(
        title: "Хорошо",
        parent: self.view,
        action: #selector(navigateToRootVC),
        isEnabled: true
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .systemBackground
        view.addSubViews(wreathImageView, thanksImageView, promoLabel, okButton, closeButton)
    }

    @objc private func navigateToRootVC() {
        print(#function)
        dismiss(animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

    @objc private func closeSelf() {
        print(#function)
        dismiss(animated: true)
    }
}

