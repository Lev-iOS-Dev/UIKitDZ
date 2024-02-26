// AnchoresTrafficLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со светофором используя аnchores
final class AnchoresTrafficLightViewController: UIViewController {
    
    // MARK: - Constants

    enum Constants {
        enum Insets {
            static let colorViewMultiplier: CGFloat = 1 / 3
            static let traficLightWidthMultiplier: CGFloat = 1 / 5
            static let traficLightHeightMultiplier: CGFloat = 3
            static let lightViewBorderWidth: CGFloat = 20
        }
    }
    
    // MARK: - Visual Components

    private let trafficLightView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
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
        view.addSubviews([
            trafficLightView
        ])
        trafficLightView.addSubviews([
            redView,
            yellowView,
            greenView
        ])
        view.backgroundColor = .white
    }

    private func configureSubviews() {
        configureTrafficView()
        configureRedView()
        configureYellowView()
        configureGreenView()
    }

    private func configureTrafficView() {
        NSLayoutConstraint.activate([
            trafficLightView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            trafficLightView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            trafficLightView.widthAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: Constants.Insets.traficLightWidthMultiplier
            ),
            trafficLightView.heightAnchor.constraint(
                equalTo: trafficLightView.widthAnchor,
                multiplier: Constants.Insets.traficLightHeightMultiplier
            )
        ])
    }

    private func configureRedView() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(
                equalTo: trafficLightView.topAnchor
            ),
            redView.leadingAnchor.constraint(
                equalTo: trafficLightView.leadingAnchor
            ),
            redView.trailingAnchor.constraint(
                equalTo: trafficLightView.trailingAnchor
            )
        ])
    }

    private func configureYellowView() {
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(
                equalTo: redView.bottomAnchor
            ),
            yellowView.leadingAnchor.constraint(
                equalTo: trafficLightView.leadingAnchor
            ),
            yellowView.trailingAnchor.constraint(
                equalTo: trafficLightView.trailingAnchor
            )
        ])
    }

    private func configureGreenView() {
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(
                equalTo: yellowView.bottomAnchor
            ),
            greenView.leadingAnchor.constraint(
                equalTo: trafficLightView.leadingAnchor
            ),
            greenView.trailingAnchor.constraint(
                equalTo: trafficLightView.trailingAnchor
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
            view.widthAnchor.constraint(
                equalTo: trafficLightView.heightAnchor,
                multiplier: Constants.Insets.colorViewMultiplier
            ).isActive = true
            view.heightAnchor.constraint(
                equalTo: view.widthAnchor
            ).isActive = true
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = Constants.Insets.lightViewBorderWidth
            view.layer.cornerRadius = trafficLightView.frame.size.width / 2
        }
    }
}
