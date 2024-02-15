// GreenButtonView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Button with mint color placed at the bottom of parent view
final class MintColorBottomButton: UIButton {
    // MARK: - Constants
    private enum Constants {
        static let bottomInset: CGFloat = 148
        static let height: CGFloat = 44
        static let edgeInset: CGFloat = 20
        static let cornerRadius: CGFloat = 12
    }
    // MARK: - Public Properties

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    // MARK: - Private properties
    private let title: String
    private let parentView: UIView
    private let action: Selector

    // MARK: - Initializers

    init(title: String, parent view: UIView, action: Selector, isEnabled: Bool) {
        self.title = title
        parentView = view
        self.action = action
        super.init(frame: .zero)
        self.isEnabled = isEnabled
        setAppearance()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private functions
    private func setAppearance() {
        let frame = CGRect(
            x: Constants.edgeInset,
            y: parentView.frame.height - Constants.bottomInset,
            width: parentView.frame.width - 2*Constants.edgeInset,
            height: Constants.height)
        self.frame = frame
        backgroundColor = .mintApp
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = Constants.cornerRadius
        titleLabel?.font = UIFont.makeVerdanaBold16()
        addTarget(nil, action: action, for: .touchUpInside)
    }
}
