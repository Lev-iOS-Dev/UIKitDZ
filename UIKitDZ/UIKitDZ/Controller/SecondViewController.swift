//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 07.02.24.
//

import UIKit

/// Главный Вью контроллер
class SecondViewController: UIViewController {
    // MARK: - Private Properties
    private var hasDisabledAlert = false
    private var secondView: SecondView!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        secondView = SecondView(frame: view.bounds)
        secondView.startButton.addTarget(self, 
            action: #selector(didTapStartButton(_:)), for: .touchUpInside)
        view.addSubview(secondView)
        configureSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureSubviews()
    }
    // MARK: - Private Methods
    private func configureSubviews() {
        let startButtonY = hasDisabledAlert ? CGFloat(611) : CGFloat(406)
        secondView.startTextTitleLabel.frame = CGRect(
            x: 50, y: 106, width: 275, height: 57)
        secondView.startTextDiscriptionLabel.frame = CGRect(
            x: 50, y: 163, width: 275, height: 57)
        secondView.revercedTextTitleLabel.frame = CGRect(
            x: 50, y: 282, width: 275, height: 57)
        secondView.revercedTextDiscriptionLabel.frame = CGRect(
            x: 50, y: 339, width: 275, height: 57)
        secondView.startButton.frame = CGRect(
            x: 20, y: startButtonY, width: 335, height: 44)
    }
    // MARK: - Actions
    @objc private func didTapStartButton(_ sender: UIButton) {
        var revercedText = ""
        let alertController = UIAlertController(
            title: "Введите ваше слова", message: nil,
            preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите слова"
            textField.keyboardType = .default
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            guard let textField = alertController.textFields?.first else { return }
            revercedText = String(textField.text?.reversed() ?? "".reversed())
            self.secondView.startTextDiscriptionLabel.text = textField.text
            self.secondView.revercedTextDiscriptionLabel.text = revercedText
            self.hasDisabledAlert = true
            self.secondView.startTextTitleLabel.isHidden = false
            self.secondView.startTextDiscriptionLabel.isHidden = false
            self.secondView.revercedTextTitleLabel.isHidden = false
            self.secondView.revercedTextDiscriptionLabel.isHidden = false
            self.configureSubviews()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
