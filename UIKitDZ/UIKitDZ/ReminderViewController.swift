//
//  ReminderViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

/// Экран где показывается список ближайших дней рождений
class ReminderViewController: UIViewController {
    // MARK: - Private Properties
    private lazy var firstProfileImage = createProfileImage(imageName: "profile_1")
    private lazy var secondProfileImage = createProfileImage(imageName: "profile_2")
    private lazy var thirdProfileImage = createProfileImage(imageName: "profile_3")
    private lazy var fourthProfileImage = createProfileImage(imageName: "profile_4")
    private lazy var firstProfileName = createProfileName(name: "Helena Link")
    private lazy var secondProfileName = createProfileName(name: "Verona Tusk")
    private lazy var thirdProfileName = createProfileName(name: "Alex Smith")
    private lazy var fourthProfileName = createProfileName(name: "Tom Johnson")
    private lazy var firstProfileBirthDay = createProfileName(name: "10.03 - turns 25!")
    private lazy var secondProfileBirthDay = createProfileName(name: "20.03 - turns 39")
    private lazy var thirdProfileBirthDay = createProfileName(name: "21.04 - turns 51")
    private lazy var fourthProfileBirthDay = createProfileName(name: "05.06 - turns 18")
    private lazy var firstBirthDayCountDown = createBirdtDayCountDown(
        imageName: "birdhDay_1")
    private lazy var secondBirthDayCountDown = createBirdtDayCountDown(
        imageName: "birdhDay_2")
    private lazy var thirdBirthDayCountDown = createBirdtDayCountDown(
        imageName: "birdhDay_3")
    private lazy var fourthBirthDayCountDown = createBirdtDayCountDown(
        imageName: "birdhDay_4")
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialSetup()
        setupSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureSubviews()
    }
    // MARK: - Private Methods
    private func setupSubviews() {
        view.addSubviews([
           firstProfileImage,
           secondProfileImage,
           thirdProfileImage,
           fourthProfileImage,
           firstProfileName,
           secondProfileName,
           thirdProfileName,
           fourthProfileName,
           firstProfileBirthDay,
           secondProfileBirthDay,
           thirdProfileBirthDay,
           fourthProfileBirthDay,
           firstBirthDayCountDown,
           secondBirthDayCountDown,
           thirdBirthDayCountDown,
           fourthBirthDayCountDown
        ])
    }
    private func configureSubviews() {
        firstProfileImage.frame = CGRect(
            x: 19, y: 105, width: 75, height: 75)
        secondProfileImage.frame = CGRect(
            x: 19, y: 200, width: 75, height: 75)
        thirdProfileImage.frame = CGRect(
            x: 19, y: 295, width: 75, height: 75)
        fourthProfileImage.frame = CGRect(
            x: 19, y: 390, width: 75, height: 75)
        firstProfileName.frame = CGRect(
            x: 102, y: 119, width: 209, height: 20)
        secondProfileName.frame = CGRect(
            x: 102, y: 214, width: 209, height: 20)
        thirdProfileName.frame = CGRect(
            x: 102, y: 309, width: 209, height: 20)
        fourthProfileName.frame = CGRect(
            x: 102, y: 404, width: 209, height: 20)
        firstProfileBirthDay.frame = CGRect(
            x: 102, y: 147, width: 209, height: 20)
        secondProfileBirthDay.frame = CGRect(
            x: 102, y: 242, width: 209, height: 20)
        thirdProfileBirthDay.frame = CGRect(
            x: 102, y: 337, width: 209, height: 20)
        fourthProfileBirthDay.frame = CGRect(
            x: 102, y: 432, width: 209, height: 20)
        firstBirthDayCountDown.frame = CGRect(
            x: 314, y: 119, width: 44, height: 44)
        secondBirthDayCountDown.frame = CGRect(
            x: 314, y: 214, width: 44, height: 44)
        thirdBirthDayCountDown.frame = CGRect(
            x: 314, y: 309, width: 44, height: 44)
        fourthBirthDayCountDown.frame = CGRect(
            x: 314, y: 404, width: 44, height: 44)
    }
    private func makeInitialSetup() {
        view.backgroundColor = .white
        title = "Birthday Reminder"
        let plusImage = UIImage(systemName: "plus")
        let addButton = UIBarButtonItem(
            image: plusImage, style: .plain,
            target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    private func createProfileImage(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    private func createProfileName(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#111111")
        return label
    }
    private func createProfileBirthDay(date: String) -> UILabel {
        let label = UILabel()
        label.text = date
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#111111")
        return label
    }
    private func createBirdtDayCountDown(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    @objc private func addButtonTapped() {
        
    }
}

