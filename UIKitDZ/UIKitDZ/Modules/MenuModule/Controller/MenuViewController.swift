// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General menu screen
final class MenuViewController: UIViewController {
    // MARK: - Constants

    private let guestButtonLabel = "Г"

    // MARK: - Private Properties

    private lazy var brownBackgroundView = BrownBackgroundView(frame: view.bounds, yLogoPosition: 70)
    private lazy var whiteView = view.makeBottomWhiteView(height: 563)
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать,\nГость"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = .brownExtraLight
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 20, y: 185)
        return label
    }()

    private lazy var guestButton: UIButton = {
        let button = MintColorBottomButton(
            title: guestButtonLabel,
            parent: self.view,
            action: #selector(navigateToCoffeeScreen),
            isEnabled: true
        )
        button.frame = CGRect(x: 326, y: 185, width: 44, height: 44)
        button.layer.cornerRadius = 22
        return button
    }()

    private lazy var adressView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 70))
        view.backgroundColor = .lightMintApp
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Адреса кофеен"
        label.font = UIFont(name: "Verdana-bold", size: 12)
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 12, y: 12)
        return label
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Разрѣшите доступъ къ ​геолокаціи для \nпоиска ближайшей кофейни "
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana", size: 12)
        label.textColor = .gray
        label.sizeToFit()
        label.frame.origin = CGPoint(x: 15, y: 30)
        return label
    }()

    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 310, y: 20, width: 20, height: 29))
        imageView.image = UIImage(named: "location")
        return imageView
    }()

    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 122, width: 125, height: 80))
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "menu")
        return imageView
    }()

    private lazy var cakeMenuView = MenuView(labelText: "Пти пате аля «РюсЪ»", imageName: "cake", yPosition: 216)
    private lazy var hotDrinksView = MenuView(labelText: "Горячiя напитки»", imageName: "hotDrinks", yPosition: 316)
    private lazy var coffeeView = MenuView(labelText: "Кофий»", imageName: "coffee", yPosition: 416)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(brownBackgroundView, whiteView, welcomeLabel, guestButton)
        whiteView.addSubViews(adressView, menuImageView, cakeMenuView, hotDrinksView, coffeeView)
        adressView.addSubViews(adressLabel, locationLabel, locationImageView)
    }

    private func configureSubviews() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToCoffeeScreen))
        coffeeView.addGestureRecognizer(tapGesture)
        coffeeView.isUserInteractionEnabled = true
    }

    @objc func navigateToCoffeeScreen() {
        let coffeeeVC = CoffeeViewController()
        navigationController?.pushViewController(coffeeeVC, animated: true)
    }
}
