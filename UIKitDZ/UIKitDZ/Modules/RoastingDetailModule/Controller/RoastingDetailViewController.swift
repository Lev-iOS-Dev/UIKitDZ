// RoastingDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol RoastingDetailViewControllerDelegate: AnyObject {
    func didDismissViewController(imageName: String, description: String)
}

/// Screen to choose roasting kind
class RoastingDetailViewController: UIViewController {
    // MARK: - Public Properties

    weak var delegate: RoastingDetailViewControllerDelegate?

    // MARK: - Private Properties

    private var descriptionText = "Темная\nобжарка"
    private var imageName = "darkRoasting"
    private var selectedItem = ""

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapDismissButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private var selectRoastingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#111111")
        label.text = "Уточните обжарку зеренъ"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private lazy var tapGestureDarkRoasting = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapDarkRoastingView(_:))
    )

    private lazy var darkRoastingView = createModificationView(
        imageName: "darkRoasting",
        description: "Темная\nобжарка",
        coordinates: (x: 15, y: 102),
        gestureRecognizer: tapGestureDarkRoasting
    )

    private lazy var tapGestureLightRoasting = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapLightRoastingView(_:))
    )

    private lazy var lightRoastingView = createModificationView(
        imageName: "lightRoasting",
        description: "Свѣтлая\nобжарка",
        coordinates: (x: 195, y: 102),
        gestureRecognizer: tapGestureLightRoasting
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(
            dismissButton,
            selectRoastingLabel,
            darkRoastingView,
            lightRoastingView
        )
    }

    private func configureSubviews() {
        dismissButton.frame = CGRect(x: 15, y: 21, width: 24, height: 24)
        selectRoastingLabel.frame = CGRect(x: 40, y: 53, width: 294, height: 30)

        darkRoastingView.layer.borderWidth = 2
    }

    private func createModificationView(
        imageName: String,
        description: String,
        coordinates: (x: Int, y: Int),
        gestureRecognizer: UIGestureRecognizer?
    ) -> UIView {
        let containerView = UIView(frame: CGRect(
            x: coordinates.x,
            y: coordinates.y,
            width: 165,
            height: 165
        ))
        containerView.backgroundColor = UIColor(hex: "#F7F7F7")
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor(hex: "#59BEC7").cgColor

        let imageView = UIImageView(frame: CGRect(
            x: 30, y: 15, width: 100, height: 100
        ))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .center

        let descriptionLabel = UILabel(frame: CGRect(
            x: 0, y: 117, width: containerView.frame.width, height: 34
        ))
        descriptionLabel.text = description
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0

        containerView.addSubview(imageView)
        containerView.addSubview(descriptionLabel)

        if let gesture = gestureRecognizer {
            containerView.addGestureRecognizer(gesture)
        }

        return containerView
    }

    @objc private func didTapDismissButton(_ sender: UIButton) {
        delegate?.didDismissViewController(
            imageName: imageName,
            description: descriptionText
        )
        dismiss(animated: true)
    }

    @objc func didTapDarkRoastingView(_ sender: UITapGestureRecognizer) {
        lightRoastingView.layer.borderWidth = 0
        darkRoastingView.layer.borderWidth = 2
        imageName = "darkRoasting"
        descriptionText = "Темная\nобжарка"
    }

    @objc func didTapLightRoastingView(_ sender: UITapGestureRecognizer) {
        darkRoastingView.layer.borderWidth = 0
        lightRoastingView.layer.borderWidth = 2
        imageName = "lightRoasting"
        descriptionText = "Свѣтлая\nобжарка"
    }
}
