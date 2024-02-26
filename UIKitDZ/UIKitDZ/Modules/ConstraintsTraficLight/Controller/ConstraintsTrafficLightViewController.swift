// ConstraintsTrafficLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со светофором используя constraints
final class ConstraintsTrafficLightViewController: UIViewController {
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
            NSLayoutConstraint(
                item: trafficLightView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: trafficLightView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: trafficLightView,
                attribute: .width,
                relatedBy: .equal,
                toItem: view,
                attribute: .height,
                multiplier: Constants.Insets.traficLightWidthMultiplier,
                constant: 0
            ),
            NSLayoutConstraint(
                item: trafficLightView,
                attribute: .height,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .width,
                multiplier: Constants.Insets.traficLightHeightMultiplier,
                constant: 0
            )
        ])
    }

    private func configureRedView() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: redView,
                attribute: .top,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .top,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .leading,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .trailing,
                multiplier: 1,
                constant: 0
            )
        ])
    }

    private func configureYellowView() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: yellowView,
                attribute: .top,
                relatedBy: .equal,
                toItem: redView,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .leading,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .trailing,
                multiplier: 1,
                constant: 0
            )
        ])
    }

    private func configureGreenView() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: greenView,
                attribute: .top,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .leading,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: trafficLightView,
                attribute: .trailing,
                multiplier: 1,
                constant: 0
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
            NSLayoutConstraint.activate([
                NSLayoutConstraint(
                    item: view,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: trafficLightView,
                    attribute: .height,
                    multiplier: Constants.Insets.colorViewMultiplier,
                    constant: 0
                ),
                NSLayoutConstraint(
                    item: view,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .width,
                    multiplier: 1,
                    constant: 0
                )
            ])
            
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = Constants.Insets.lightViewBorderWidth
            view.layer.cornerRadius = trafficLightView.frame.size.width / 2
        }
    }
}
