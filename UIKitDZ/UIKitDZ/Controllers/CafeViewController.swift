//
//  CafeViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 11.02.24.
//

import UIKit
/// Экран кафе
class CafeViewController: UIViewController {
    var isActive = true
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var guestsCountTextField: UITextField!
    @IBOutlet weak var tableNumberTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialSetup()
    }
    // MARK: - IBActions
    @IBAction func didTapCheckButton(_ sender: UIButton) {
        showCheckAlert()
    }
    // MARK: - Private Methods
    private func makeInitialSetup() {
        view.backgroundColor = .white
        checkButton.isUserInteractionEnabled = false
        nameTextField.delegate = self
        guestsCountTextField.delegate = self
        tableNumberTextField.delegate = self
    }
    private func showCheckAlert() {
        let checkAlertController = UIAlertController(
            title: "Выставить счет?", message: nil,
            preferredStyle: .alert)
        let checkAction = UIAlertAction(
            title: "Чек", style: .default) { _ in
                self.performSegue(
                    withIdentifier: "checkViewController", sender: nil)
            }
        let cancelAction =  UIAlertAction(
            title: "Отмена", style: .cancel)
        checkAlertController.addAction(checkAction)
        checkAlertController.addAction(cancelAction)
        present(checkAlertController, animated: true)
    }
    private func navigateToCheckViewController() { }
}
// MARK: - Extensions
extension CafeViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let name = nameTextField.text,
              let guestsCount = guestsCountTextField.text,
                let tableNumber = tableNumberTextField.text
        else { return }
        if !name.isEmpty && !guestsCount.isEmpty && !tableNumber.isEmpty {
            self.checkButton.isUserInteractionEnabled = true
            self.checkButton.backgroundColor = UIColor(hex: "#16BDCD")
        } else {
            self.checkButton.isUserInteractionEnabled = false
            self.checkButton.backgroundColor = UIColor(hex: "#8ADEE6")
        }
    }
}
