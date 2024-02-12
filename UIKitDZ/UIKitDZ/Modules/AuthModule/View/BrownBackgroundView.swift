//
//  BrownBackgroundView.swift
//  CofeeApp
//
//  Created by Dmitry on 12.02.2024.
//

import UIKit

class BrownBackgroundView: UIView {
    // MARK: - Types
    
    // MARK: - Constants
    // MARK: - Visual Components
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "text"
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.sizeToFit()
        label.frame.origin = .zero
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycle
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    private func setUI() {
        backgroundColor = .brownCustom
    }
}
//private lazy var loginButton: UIButton = {
//    let button = UIButton(frame: CGRect(x: 20, y: 750, width: UIScreen.main.bounds.width - 40, height: 44))
//    button.backgroundColor = UIColor(named: "customRedColor")
//    button.layer.cornerRadius = 12
//    button.setTitle("Login", for: .normal)
//    button.setTitleColor(.white, for: .normal)
//    button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 16)
//    button.addTarget(nil, action: #selector(moveToBirthdayVC), for: .touchUpInside)
//    button.isEnabled = false
//    button.alpha = 0.5
//    return button
//}()
