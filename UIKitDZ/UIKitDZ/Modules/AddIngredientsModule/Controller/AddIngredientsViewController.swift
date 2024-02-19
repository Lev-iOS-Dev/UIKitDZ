// AddIngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// функция для передачи данных в предыдущий вью контроллер
protocol AddIngredientsViewControllerDelegate: AnyObject {
    func didDismissAddIngredientsViewController(price: Int)
}

/// Screen to show additional ingredients
final class AddIngredientsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let dismissButton = "dismissButton"
    }

    // MARK: - Public Properties

    weak var delegate: AddIngredientsViewControllerDelegate?

    // MARK: - Private Properties

    private var addedIngredientsPrice = 0
    private let prices = [50, 20, 50, 70, 50]
    private let ingredients = [
        "Молоко",
        "Сироп",
        "Молоко соевое",
        "Молоко миндальное",
        "Эспрессо 50мл"
    ]

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

    private let selectAdditionalIngredientLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#111111")
        label.text = "Выберите дополнительные ингредіенты"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private lazy var milkLabel = makeLabelWith(name: "Молоко", price: "+50 руб")
    private lazy var syrupLabel = makeLabelWith(name: "Сироп ", price: "+20 руб")
    private lazy var soyMlkLabel = makeLabelWith(name: "Молоко соевое", price: "+50 руб")
    private lazy var almondMilkLabel = makeLabelWith(
        name: "Молоко миндальное", price: "+70 руб"
    )
    private lazy var espressoLabel = makeLabelWith(name: "Эспрессо 50мл", price: "+50 руб")

    private lazy var milkSwitch = makeSwitchWith(tag: 0)
    private lazy var syrupSwitch = makeSwitchWith(tag: 1)
    private lazy var soyMilkSwitch = makeSwitchWith(tag: 2)
    private lazy var almondMilkSwitch = makeSwitchWith(tag: 3)
    private lazy var espressoSwitch = makeSwitchWith(tag: 4)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        configureSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSwitchesStates()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .white
        view.addSubViews(
            dismissButton,
            selectAdditionalIngredientLabel,
            milkLabel,
            syrupLabel,
            soyMlkLabel,
            almondMilkLabel,
            espressoLabel,
            milkSwitch,
            syrupSwitch,
            soyMilkSwitch,
            almondMilkSwitch,
            espressoSwitch
        )
    }

    private func configureSubviews() {
        dismissButton.frame = CGRect(
            x: 15, y: 21, width: 24, height: 24
        )
        selectAdditionalIngredientLabel.frame = CGRect(
            x: 40, y: 53, width: 294, height: 44
        )
        milkLabel.frame = CGRect(x: 20, y: 124, width: 275, height: 35)
        syrupLabel.frame = CGRect(x: 20, y: 174, width: 275, height: 35)
        soyMlkLabel.frame = CGRect(x: 20, y: 224, width: 275, height: 35)
        almondMilkLabel.frame = CGRect(x: 20, y: 274, width: 275, height: 35)
        espressoLabel.frame = CGRect(x: 20, y: 324, width: 275, height: 35)
        milkSwitch.frame = CGRect(x: 301, y: 124, width: 54, height: 35)
        syrupSwitch.frame = CGRect(x: 301, y: 174, width: 54, height: 35)
        soyMilkSwitch.frame = CGRect(x: 301, y: 224, width: 54, height: 35)
        almondMilkSwitch.frame = CGRect(x: 301, y: 274, width: 54, height: 35)
        espressoSwitch.frame = CGRect(x: 301, y: 324, width: 54, height: 35)
    }

    private func makeLabelWith(name: String, price: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left

        let attributedText = NSMutableAttributedString(string: "\(name) \(price)")
        attributedText.addAttribute(
            .foregroundColor,
            value: UIColor(hex: "#64B582"),
            range: NSRange(location: name.count + 1, length: price.count)
        )

        label.attributedText = attributedText

        return label
    }

    private func updateSwitchesStates() {
        let mySwitches = [
            milkSwitch,
            syrupSwitch,
            soyMilkSwitch,
            almondMilkSwitch,
            espressoSwitch
        ]

        for (index, switchLabel) in mySwitches.enumerated() {
            if let isOn = AddIngredientsModel.statesMap[ingredients[index]] {
                switchLabel.isOn = isOn
            }
        }
    }

    private func makeSwitchWith(tag: Int) -> UISwitch {
        let mySwitch = UISwitch()
        mySwitch.isOn = false
        mySwitch.tag = tag
        mySwitch.addTarget(
            self,
            action: #selector(didChangeSwitchValue(_:)),
            for: .valueChanged
        )
        return mySwitch
    }

    @objc private func didTapDismissButton(_ sender: UIButton) {
        delegate?.didDismissAddIngredientsViewController(price: addedIngredientsPrice)
        dismiss(animated: true)
    }

    @objc private func didChangeSwitchValue(_ sender: UISwitch) {
        if sender.isOn {
            addedIngredientsPrice += prices[sender.tag]
            AddIngredientsModel.statesMap.updateValue(
                true, forKey: ingredients[sender.tag]
            )
        } else {
            addedIngredientsPrice -= prices[sender.tag]
            AddIngredientsModel.statesMap.updateValue(
                false, forKey: ingredients[sender.tag]
            )
        }
    }
}
