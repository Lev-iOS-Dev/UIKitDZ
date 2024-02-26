// StackViewTrafficLightController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для светофора с использованием UIStackView
final class StackViewTrafficLightController: UIViewController {
    // MARK: - Visual Components

    private lazy var trafficLightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.backgroundColor = .black

        stackView.addArrangedSubviews([
            redView,
            yellowView,
            greenView
        ])
        return stackView
    }()

    private lazy var redView = makeCircularView(
        withColor: .red
    )
    private lazy var yellowView = makeCircularView(
        withColor: .yellow
    )
    private lazy var greenView = makeCircularView(
        withColor: .green
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLighViewsCornerRadiuses()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([trafficLightStackView])
        view.backgroundColor = .white
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            trafficLightStackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            trafficLightStackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            trafficLightStackView.widthAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.2
            ),
            trafficLightStackView.heightAnchor.constraint(
                equalTo: trafficLightStackView.widthAnchor,
                multiplier: 3.0
            )
        ])
    }

    private func makeCircularView(withColor color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.clipsToBounds = true
        return view
    }

    private func setupLighViewsCornerRadiuses() {
        let lightViews = [redView, yellowView, greenView]
        for view in lightViews {
            view.layer.cornerRadius = trafficLightStackView.frame.size.width / 2
        }
    }
}
