// PaymentCompleteViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Payment confirmation screen
class PaymentCompleteViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 51, width: 24, height: 24))
        button.addTarget(self, action: #selector(closeSelf), for: .touchUpInside)
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()

    private lazy var wreathImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 88, width: 200, height: 87))
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "wreath")
        return imageView
    }()

    private lazy var thanksImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 214, width: 235, height: 128))
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "thanksForOrder")
        return imageView
    }()

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
