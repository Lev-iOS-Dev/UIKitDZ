//
//  AddPersonViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

/// Экран для добавления новых дней рождений
class AddBirthDayViewController: UIViewController {
    // MARK: - Private Properties
    private var newPImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "birthDay")
        return view
    }()
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
         
        ])
    }
    private func configureSubviews() {
//        firstProfileImage.frame = CGRect(
//            x: 19, y: 105, width: 75, height: 75)
    }
    private func makeInitialSetup() {
        view.backgroundColor = .white
        let plusImage = UIImage(systemName: "plus")
        let addButton = UIBarButtonItem(
            image: plusImage, style: .plain,
            target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
   
}
