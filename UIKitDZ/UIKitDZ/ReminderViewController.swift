//
//  ReminderViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

/// Экран где показывается список ближайших дней рождений
class ReminderViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static var StartY = 105
        static var rowHeight = 95
        static var MaximumY = 105
    }
    private let initialProfileImageNames = [
        "profile_1", "profile_2", "profile_3", "profile_4"
    ]
    private let initialProfileNames = [
        "Helena Link", "Verona Tusk", "Alex Smith", "Tom Johnson"
    ]
    private let initialProfileBirthDays = [
        "10.03 - turns 25!", "20.03 - turns 39",
        "21.04 - turns 51", "05.06 - turns 18"
    ]
    private let initialBirthDayCountDowns = [
        "birdhDay_1", "birdhDay_2", "birdhDay_3", "birdhDay_4"
    ]
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialSetup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeInitialReminders()
    }
    // MARK: - Private Methods
    private func makeInitialSetup() {
        view.backgroundColor = .white
        title = "Birthday Reminder"
        let plusImage = UIImage(systemName: "plus")
        let addButton = UIBarButtonItem(
            image: plusImage, style: .plain,
            target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    private func makeProfileImage(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    private func makeProfileName(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#111111")
        return label
    }
    private func makeProfileBirthDay(date: String) -> UILabel {
        let label = UILabel()
        label.text = date
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#111111")
        return label
    }
    private func makeBirdtDayCountDown(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    private func makeNewBirthDayReminder(
        profileImageName: String, name: String,
        date: String, countDownImageName: String, originY: CGFloat) {
            let profileImage = makeProfileImage(imageName: profileImageName)
            let nameLabel = makeProfileName(name: name)
            let dateImage = makeProfileBirthDay(date: date)
            let countDownImage = makeBirdtDayCountDown(
                imageName: countDownImageName)
            profileImage.frame = CGRect(
                x: 19, y: originY, width: 75, height: 75)
            nameLabel.frame = CGRect(
                x: 102, y: (originY + 14), width: 209, height: 20)
            dateImage.frame = CGRect(
                x: 102, y: (originY + 42), width: 209, height: 20)
            countDownImage.frame = CGRect(
                x: 314, y: (originY + 14), width: 44, height: 44)
            view.addSubviews([
                profileImage,
                nameLabel,
                dateImage,
                countDownImage
            ])

    }
    private func makeInitialReminders() {
        for index in 0..<initialProfileNames.count {
            makeNewBirthDayReminder(
                profileImageName: initialProfileImageNames[index],
                name: initialProfileNames[index],
                date: initialProfileBirthDays[index],
                countDownImageName: initialBirthDayCountDowns[index],
                originY: CGFloat(
                    Constants.StartY + (index * Constants.rowHeight))
            )
            Constants.MaximumY += Constants.rowHeight
        }
    }
    @objc private func addButtonTapped() {
        let nextVC = AddBirthDayViewController()
        nextVC.delegate = self
        let navigationController = UINavigationController(
            rootViewController: nextVC)
        self.present(navigationController, animated: true)
    }
}
extension ReminderViewController: AddBirthDayViewControllerDelegate {
    func addNewReminderWithOptions(
        profileImageName: String,
        name: String,
        date: String,
        countDownImageName: String) {
            self.makeNewBirthDayReminder(
                profileImageName: profileImageName,
                name: name,
                date: date,
                countDownImageName: countDownImageName,
                originY: CGFloat(Constants.MaximumY))
            Constants.MaximumY += Constants.rowHeight
    }
}
