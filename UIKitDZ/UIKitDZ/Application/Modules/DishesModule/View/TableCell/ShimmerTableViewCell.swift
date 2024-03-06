// ShimmerTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для отображения шиммера
final class ShimmerTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let identifier = "ShimmerTableViewCell"
    }

    // MARK: - Visual Components

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .myLightGray
        return view
    }()

    private let dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        return imageView
    }()

    private let dishImageViewLayer = CAGradientLayer()

    private let dishNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let dishNameLabelLayer = CAGradientLayer()

    private let timerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let timerNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let timerNumberLabelLayer = CAGradientLayer()

    private let caloriesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let caloriesCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let caloriesCountLabelLayer = CAGradientLayer()

    private let arrowImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - Initalizers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupViewGradients()
    }

    // MARK: - Private Methodes

    private func makeAnimationGroup() -> CAAnimationGroup {
        let animationDuration: CFTimeInterval = 1.5

        let firstAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        firstAnimation.fromValue = UIColor.white.cgColor
        firstAnimation.toValue = UIColor.textFieldBorder.cgColor
        firstAnimation.duration = animationDuration
        firstAnimation.beginTime = 0.0

        let secondAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        secondAnimation.fromValue = UIColor.textFieldBorder.cgColor
        secondAnimation.toValue = UIColor.white.cgColor
        secondAnimation.duration = animationDuration
        secondAnimation.beginTime = firstAnimation.beginTime + firstAnimation.duration

        let group = CAAnimationGroup()
        group.animations = [firstAnimation, secondAnimation]
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = secondAnimation.beginTime + secondAnimation.duration
        group.isRemovedOnCompletion = false

        return group
    }

    func setupGradientLayer(view: UIView, layer: CAGradientLayer, key: String, animation: CAAnimationGroup) {
        layer.frame = view.bounds
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)

        layer.cornerRadius = view.layer.cornerRadius
        view.layer.addSublayer(layer)
        layer.add(animation, forKey: key)
    }

    private func setupSubviews() {
        contentView.addSubviews([
            containerView
        ])
        containerView.addSubviews([
            dishImageView,
            dishNameLabel,
            timerImageView,
            timerNumberLabel,
            caloriesImageView,
            caloriesCountLabel,
            arrowImageVIew
        ])
    }

    private func setupConstraints() {
        setupContainerViewConstraints()
        setupDishImageViewConstraints()
        setupDishNameLabelConstraints()
        setupTimerImageViewConstraints()
        setupTimerNumberLabelConstraints()
        setupCaloriesImageViewConstraints()
        setupCaloriesCountLabelConstraints()
        setupArrowImageView()
    }

    private func setupViewGradients() {
        setupGradientLayer(
            view: dishImageView,
            layer: dishImageViewLayer,
            key: "dishImageView",
            animation: makeAnimationGroup()
        )
        setupGradientLayer(
            view: dishNameLabel,
            layer: dishNameLabelLayer,
            key: "dishNameLabel",
            animation: makeAnimationGroup()
        )
        setupGradientLayer(
            view: timerNumberLabel,
            layer: timerNumberLabelLayer,
            key: "timeNumberLabel",
            animation: makeAnimationGroup()
        )
        setupGradientLayer(
            view: caloriesCountLabel,
            layer: caloriesCountLabelLayer,
            key: "caloriesCountLabel",
            animation: makeAnimationGroup()
        )
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            containerView.widthAnchor.constraint(
                equalToConstant: 350
            ),
            containerView.heightAnchor.constraint(
                equalToConstant: 100
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -12
            )
        ])
    }

    private func setupDishImageViewConstraints() {
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 10
            ),
            dishImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 10
            ),
            dishImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -10
            ),
            dishImageView.widthAnchor.constraint(
                equalToConstant: 80
            ),
            dishImageView.heightAnchor.constraint(
                equalToConstant: 80
            ),
        ])
    }

    private func setupDishNameLabelConstraints() {
        NSLayoutConstraint.activate([
            dishNameLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 22
            ),
            dishNameLabel.leadingAnchor.constraint(
                equalTo: dishImageView.trailingAnchor,
                constant: 20
            ),
            dishNameLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -43
            ),
            dishNameLabel.heightAnchor.constraint(
                equalToConstant: 32
            ),
            dishNameLabel.widthAnchor.constraint(
                equalToConstant: 197
            ),
        ])
    }

    private func setupTimerImageViewConstraints() {
        NSLayoutConstraint.activate([
            timerImageView.topAnchor.constraint(
                equalTo: dishNameLabel.bottomAnchor,
                constant: 8
            ),
            timerImageView.leadingAnchor.constraint(
                equalTo: dishImageView.trailingAnchor,
                constant: 20
            ),
            timerImageView.heightAnchor.constraint(
                equalToConstant: 15
            ),
            timerImageView.widthAnchor.constraint(
                equalToConstant: 15
            ),
        ])
    }

    private func setupTimerNumberLabelConstraints() {
        NSLayoutConstraint.activate([
            timerNumberLabel.leadingAnchor.constraint(
                equalTo: timerImageView.trailingAnchor,
                constant: 4
            ),
            timerNumberLabel.centerYAnchor.constraint(
                equalTo: timerImageView.centerYAnchor
            ),
            timerNumberLabel.heightAnchor.constraint(
                equalToConstant: 15
            ),
            timerNumberLabel.widthAnchor.constraint(
                equalToConstant: 55
            ),
        ])
    }

    private func setupCaloriesImageViewConstraints() {
        NSLayoutConstraint.activate([
            caloriesImageView.topAnchor.constraint(
                equalTo: dishNameLabel.bottomAnchor,
                constant: 8
            ),
            caloriesImageView.leadingAnchor.constraint(
                equalTo: timerNumberLabel.trailingAnchor,
                constant: 10
            ),
            caloriesImageView.heightAnchor.constraint(
                equalToConstant: 15
            ),
            caloriesImageView.widthAnchor.constraint(
                equalToConstant: 15
            ),
        ])
    }

    private func setupCaloriesCountLabelConstraints() {
        NSLayoutConstraint.activate([
            caloriesCountLabel.leadingAnchor.constraint(
                equalTo: caloriesImageView.trailingAnchor,
                constant: 4
            ),
            caloriesCountLabel.centerYAnchor.constraint(
                equalTo: caloriesImageView.centerYAnchor
            ),
            caloriesCountLabel.heightAnchor.constraint(
                equalToConstant: 15
            ),
            caloriesCountLabel.widthAnchor.constraint(
                equalToConstant: 71.85
            ),
        ])
    }

    private func setupArrowImageView() {
        NSLayoutConstraint.activate([
            arrowImageVIew.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ),
            arrowImageVIew.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -13.33
            ),
            arrowImageVIew.heightAnchor.constraint(
                equalToConstant: 12.35
            ),
            arrowImageVIew.widthAnchor.constraint(
                equalToConstant: 20
            ),
        ])
    }
}
