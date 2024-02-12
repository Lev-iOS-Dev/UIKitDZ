//
//  AddIngredientsViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

class AddIngredientsViewController: UIViewController {
    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews()
    }

    private func configureSubviews() {}
}
