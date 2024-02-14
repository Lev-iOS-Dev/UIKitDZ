// CoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to choose kind of cofee and adjust components
class CoffeeViewController: UIViewController {
    // MARK: - Private Properties

    static var currentPrice = 100
    private let segmentedControlItems = ["Американо", "Капучино", "Латте"]

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F0E1D0")
        return view
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapBackButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var telegramButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "telegramButton"), for: .normal)
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
        view.image = UIImage(named: "coffeeAmericano")
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
//    private lazy var roastingTypeView = createModificationView(
//        imageName: "darkRoasting",
//        description: "Темная\nобжарка",
//        coordinates: (x: 15, y: 482),
//        gestureRecognizer: tapGestureRoastingType
//    )

    private lazy var tapGestureAddIngredients = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapAddIngredientsView(_:))
    )

    private lazy var addIngredientsView = createModificationView(
        imageName: "addIngredients",
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
        view.backgroundColor = .white
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(
            backgroundView,
            backButton,
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
        backgroundView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: 346
        )
        backButton.frame = CGRect(x: 24, y: 50, width: 44, height: 44)
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

    private func createModificationView(
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

        var imageView = UIImageView(frame: CGRect(
            x: 30, y: 15, width: 100, height: 100
        ))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .center

        var descriptionLabel = UILabel(frame: CGRect(
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

    @objc private func didTapBackButton(_ sender: UIButton) {}
    @objc private func didTapTelegramButton(_ sender: UIButton) {
        print("Mrint")
        showPromocodeAlert()
    }

    @objc func didChangeSelectedSegment(_ sender: UISegmentedControl) {
        var coffeeImageName = ""
        switch sender.selectedSegmentIndex {
        case 0:
            coffeeImageName = "coffeeAmericano"
        case 1:
            coffeeImageName = "coffeeCapuchino"
        case 2:
            coffeeImageName = "coffeeLatte"
        default:
            break
        }
        coffeeImageView.image = UIImage(named: coffeeImageName)
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
