//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 10.02.24.
//

import UIKit

/// Стартовый экран приложения
class StartViewController: UIViewController {
    // MARK: - Private Properties
    private var hasDisabledAlert = false
    private var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "StartVCBackground")
        view.layer.masksToBounds = false
        return view
    }()
    private var greetingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hex: "#97CBE5")
        label.text = "Приветствую, \n"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(hex: "#FFFFFF")
        label.layer.borderColor = UIColor(hex: "#EAF5FAFF").cgColor
        label.layer.borderWidth = 3
        label.isHidden = true
        return label
    }()
    private lazy var guessNumberButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#9B7FB5")
        button.setTitleColor(UIColor(hex: "#FFFEFE"), for: .normal)
        button.setTitle("Угадай\nчисло", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor(hex: "#4C241A73").cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(didTapGuessButton(_:)),
                         for: .touchUpInside)
        return button
    }()
    private lazy var calculateNumberButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#64B582")
        button.setTitleColor(UIColor(hex: "#FFFEFE"), for: .normal)
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor(hex: "#3B694CFF").cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(didTapCalculateButton(_:)),
                         for: .touchUpInside)
        return button
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureSubviews()
    }
    // MARK: - Private Methods
    private func setupSubviews() {
        view.addSubviews([
            backgroundImageView,
            greetingLabel,
            guessNumberButton,
            calculateNumberButton
        ])
    }
    private func configureSubviews() {
        let greetingLabelY = hasDisabledAlert ? CGFloat(37) : CGFloat(0)
        backgroundImageView.frame = CGRect(x: 0, y: greetingLabelY,
                                           width: view.bounds.width,
                                           height: view.bounds.height)
        greetingLabel.frame = CGRect(x: 0, y: 37, width: view.bounds.width, height: 82)
        guessNumberButton.frame = CGRect(x: 82, y: 301, width: 150, height: 150)
        calculateNumberButton.frame = CGRect(x: 132, y: 507, width: 200, height: 200)
    }
    private func showAlert() {
        alert(title: "Пожалуйста,\nпредставьтесь",
              message: nil,
              style: .alert)
    }
    @objc private func didTapGuessButton(_ sender: UIButton) {
        let randomNumber = Int.random(in: 1...10)
        showGuessNumberAlert(title: "Угадай число от 1 до 10",
                             message: nil, number: randomNumber)
    }
    private func showGuessNumberAlert(title: String, message: String?, number: Int) {
        let number = number
        var isNumberGuessed = false
        var resultTitle = "Попробуйте ещё раз"
        var resultMessage = ""
        let alertController = UIAlertController(
            title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Введите число"
            textField.keyboardType = .numberPad
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            if let textField = alertController.textFields?.first,
               let usersNumber = Int(textField.text ?? "") {
                if usersNumber == number {
                    self.showGuessResultAlert()
                } else if usersNumber > number {
                    resultMessage = "Вы ввели слишком\nбольшое число"
                } else {
                    resultMessage = "Вы ввели слишком\nмаленькое число"
                }
                self.showGuessNumberAlert(
                    title: resultTitle, message: resultMessage, number: number)
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    private func showGuessResultAlert() {
        let resultAlertController = UIAlertController(
            title: "Поздровляю", message: "Вы угадали", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        resultAlertController.addAction(okAction)
        self.present(resultAlertController, animated: true, completion: nil)
    }
    @objc private func didTapCalculateButton(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Введите ваши числа", message: nil,
            preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Число 1"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Число 2"
        }
        let mathAction = UIAlertAction(title: "Выбрать операцию", style: .default) { (_) in
            if let number1 = Int(alertController.textFields?[0].text ?? ""),
               let number2 = Int(alertController.textFields?[1].text ?? "") {
                let optionsAlert = UIAlertController(
                    title: "Выберите математическую операцию",
                    message: nil, preferredStyle: .alert)
                let addAction = UIAlertAction(title: "Сложить", style: .default) { _ in
                    let sum = number1 + number2
                    self.showResultAlert(result: sum)
                }
                let minusAction = UIAlertAction(title: "Вычесть", style: .default) { _ in
                    let difference = number1 - number2
                    self.showResultAlert(result: difference)
                }
                let multiplyAction = UIAlertAction(title: "Умножить", style: .default) { _ in
                    let product = number1 * number2
                    self.showResultAlert(result: product)
                }
                let divideAction = UIAlertAction(title: "Разделить", style: .default) { _ in
                    guard number2 != 0 else {
                        self.showResultAlert(result: nil,
                                             errorMessage: "Ошибка: деление на ноль")
                        return
                    }
                    let quotient = Double(number1) / Double(number2)
                    self.showResultAlert(result: quotient)
                }
                let cancelOperationAction = UIAlertAction(title: "Отмена", style: .cancel)
                optionsAlert.addAction(addAction)
                optionsAlert.addAction(minusAction)
                optionsAlert.addAction(multiplyAction)
                optionsAlert.addAction(divideAction)
                optionsAlert.addAction(cancelOperationAction)
                self.present(optionsAlert, animated: true, completion: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(mathAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    private func showResultAlert(result: Any?, errorMessage: String? = nil) {
        let resultAlert = UIAlertController(
            title: "Ваш результат", message: nil, preferredStyle: .alert)
        if let errorMessage = errorMessage {
            resultAlert.message = errorMessage
        } else if let result = result {
            resultAlert.message = "Результат вычислений: \(result)"
        } else {
            resultAlert.message = "Произошла ошибка"
        }
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        resultAlert.addAction(okAction)
        self.present(resultAlert, animated: true, completion: nil)
    }
}
// MARK: - Extensions
extension StartViewController {
    func alert(title: String, message: String?, style: UIAlertController.Style) {
        let alertController = UIAlertController(
            title: title, message: message,
            preferredStyle: style)
        let action = UIAlertAction(title: "Готово",
                                   style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else { return }
            self.greetingLabel.text = "Приветствую, \n \(text)"
            self.greetingLabel.isHidden = false
            self.hasDisabledAlert = true
            self.configureSubviews()
        }
        alertController.addTextField()
        alertController.textFields?.first?.placeholder = "Введите ваше имя"
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
