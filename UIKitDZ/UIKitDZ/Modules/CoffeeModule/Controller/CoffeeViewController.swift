// CoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to choose kind of cofee and adjust components
final class CoffeeViewController: UIViewController {
    private enum Constants {
        static let coffeImageNames = [
            "coffeeAmericano", "coffeeCapuchino", "coffeeLatte"
        ]
        static let backButton = "backButton"
        static let telegramButton = "telegramButton"
        static let coffeeAmericano = "coffeeAmericano"
        static let addIngredients = "addIngredients"
    }

    // MARK: - Private Properties

    static var currentPrice = 100
    private let segmentedControlItems = ["Американо", "Капучино", "Латте"]

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F0E1D0")
        return view
    }()

    private lazy var backButton: UIBarButtonItem = {
        let image = UIImage(named: Constants.backButton)?.withRenderingMode(.alwaysOriginal)
        let button = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(didTapBackButton(_:)))
        return button
    }()

    private lazy var telegramButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.telegramButton), for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.addTarget(
            self,
            action: #selector(didTapTelegramButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private var coffeeImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constants.coffeeAmericano)
        return view
    }()

    lazy var coffeeTypesSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: segmentedControlItems)
        control.selectedSegmentIndex = 0
        control.layer.masksToBounds = true
        control.tintColor = .gray
        control.layer.borderColor = UIColor.gray.cgColor
        control.backgroundColor = UIColor(hex: "#F7F7F7")
        control.selectedSegmentTintColor = UIColor(hex: "#FFFFFF")
        let font = UIFont.systemFont(ofSize: 14)
        let segmentFont = [NSAttributedString.Key.font: font]
        control.setTitleTextAttributes(segmentFont, for: .selected)
        control.addTarget(
            self,
            action: #selector(didChangeSelectedSegment(_:)),
            for: .valueChanged
        )
        return control
    }()

    private var modificationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#111111")
        label.text = "Модификация"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private lazy var tapGestureRoastingType = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapRoastingTypeView(_:))
    )
    private lazy var roastingTypeView = ModificationView(
        imageName: "darkRoasting",
        descriptionText: "Темная\nобжарка",
        coordinates: (x: 15, y: 482),
        gesture: tapGestureRoastingType
    )

    private lazy var tapGestureAddIngredients = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapAddIngredientsView(_:))
    )

    private lazy var addIngredientsView = makeModificationView(
        imageName: Constants.addIngredients,
        description: "Дополнительные\nингредиенты",
        coordinates: (x: 195, y: 482),
        gestureRecognizer: tapGestureAddIngredients
    )

    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#111111")
        label.text = "Цѣна - 100 руб"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .right
        return label
    }()

    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#59BEC7")
        button.setTitle("Заказать", for: .normal)
        button.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapOrderButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .white
        view.addSubViews(
            backgroundView,
            telegramButton,
            coffeeImageView,
            coffeeTypesSegmentedControl,
            modificationLabel,
            roastingTypeView,
            addIngredientsView,
            priceLabel,
            orderButton
        )
    }

    private func configureSubviews() {
        navigationItem.leftBarButtonItem = backButton
        backgroundView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: 346
        )
        telegramButton.frame = CGRect(x: 329, y: 56, width: 24, height: 24)
        coffeeImageView.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        coffeeTypesSegmentedControl.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        modificationLabel.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        priceLabel.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        orderButton.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        roastingTypeView.frame = CGRect(x: 15, y: 482, width: 165, height: 165)

        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
    }

    private func makeModificationView(
        imageName: String,
        description: String,
        coordinates: (x: Int, y: Int),
        gestureRecognizer: UIGestureRecognizer?
    ) -> UIView {
        let containerView = UIView(frame: CGRect(
            x: coordinates.x,
            y: coordinates.y,
            width: 165,
            height: 165
        ))
        containerView.backgroundColor = UIColor(hex: "#F7F7F7")
        containerView.layer.cornerRadius = 12

        let imageView = UIImageView(frame: CGRect(
            x: 30, y: 15, width: 100, height: 100
        ))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .center

        let descriptionLabel = UILabel(frame: CGRect(
            x: 0, y: 117, width: containerView.frame.width, height: 34
        ))
        descriptionLabel.text = description
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0

        containerView.addSubview(imageView)
        containerView.addSubview(descriptionLabel)

        if let gesture = gestureRecognizer {
            containerView.addGestureRecognizer(gesture)
        }

        return containerView
    }

    @objc private func didTapBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @objc private func didTapTelegramButton(_ sender: UIButton) {
        showPromocodeAlert()
    }

    @objc func didChangeSelectedSegment(_ sender: UISegmentedControl) {
        coffeeImageView.image = UIImage(
            named: Constants.coffeImageNames[sender.selectedSegmentIndex]
        )
    }

    @objc func didTapRoastingTypeView(_ sender: UITapGestureRecognizer) {
        let nextViewController = RoastingDetailViewController()
        nextViewController.delegate = self
        navigationController?.present(nextViewController, animated: true)
    }

    @objc func didTapAddIngredientsView(_ sender: UITapGestureRecognizer) {
        let nextViewController = AddIngredientsViewController()
        nextViewController.delegate = self
        navigationController?.present(nextViewController, animated: true)
    }

    @objc private func didTapOrderButton(_ sender: UIButton) {
        let nextViewController = OrderViewController()
        navigationController?.present(nextViewController, animated: true)
    }
}

extension CoffeeViewController: RoastingDetailViewControllerDelegate {
    func didDismissViewController(imageName: String, description: String) {
        roastingTypeView.imageName = imageName
        roastingTypeView.descriptionText = description
        roastingTypeView.updateInfo()
    }
}

extension CoffeeViewController: AddIngredientsViewControllerDelegate {
    func didDismissViewController(price: Int) {
        CoffeeViewController.currentPrice += price
        priceLabel.text = "Цѣна - \(CoffeeViewController.currentPrice) руб"
    }
}

extension CoffeeViewController {
    private func showPromocodeAlert() {
        let alertController = UIAlertController(
            title: "Поздровляем! Вы получили промокод",
            message: "КафеАлиса95",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "Отправить", style: .default)
        let cancelAction = UIAlertAction(title: "отменить", style: .cancel)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }
}
