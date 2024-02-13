// GreenButtonView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Custom button
class GreenButtonView: UIButton {
    // MARK: - Public Properties
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    // MARK: - Initializers
    
    init(title: String, parent view: UIView, action: Selector, isEnabled: Bool) {
        let frame = CGRect(x: 20, y: view.frame.height - 148, width: view.frame.width - 40, height: 44)
        super.init(frame: frame)
        // set appearance
        backgroundColor = .mintCustom
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12
        titleLabel?.font = UIFont(name: "Verdana-bold", size: 16)
        addTarget(view, action: action, for: .touchUpInside)
        self.isEnabled = isEnabled
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
