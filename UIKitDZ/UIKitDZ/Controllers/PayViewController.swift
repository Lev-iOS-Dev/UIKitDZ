//
//  PayViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit
///  страница для уведомления об отправке чека на мейл
class PayViewController: UIViewController {
    // MARK: - IBActions
    @IBOutlet weak var messageLabel: UILabel!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    // MARK: - IBActions
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    // MARK: - private methods
    private func initialSetup() {
        view.backgroundColor = .white
        let email = AuthViewController.email
        self.messageLabel.text = "Электронный чек отправили Вам на почту \(email)"
    }

}
