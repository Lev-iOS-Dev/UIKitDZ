//
//  CheckViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 11.02.24.
//

import UIKit
/// экран для показа чека и оплаты
class CheckViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var payButton: UIButton!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    // MARK: - IBActions
    @IBAction func didTapPayButton(_ sender: Any) {
        showPaymentAlert()
    }
    // MARK: - Private Methods
    private func showPaymentAlert() {
        let checkAlertController = UIAlertController(
            title: "Вы хотите оплатить\nчек?", message: nil,
            preferredStyle: .alert)
        let checkAction = UIAlertAction(
            title: "Да", style: .default) { _ in
                print("soon")
            }
        let cancelAction =  UIAlertAction(
            title: "Отмена", style: .cancel)
        checkAlertController.addAction(checkAction)
        checkAlertController.addAction(cancelAction)
        present(checkAlertController, animated: true)
    }
}
