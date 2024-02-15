// PaymentCompleteViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Payment confirmation screen
final class PaymentCompleteViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.backgroundColor = .white
        view.addSubViews()
    }
}
