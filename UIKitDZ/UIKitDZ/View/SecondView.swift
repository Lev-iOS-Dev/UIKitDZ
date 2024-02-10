//
//  SecondView.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 10.02.24.
//

import UIKit

/// Главный жкран приложения
class SecondView: UIView {
    let startTextTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#111111")
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    let startTextDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    let revercedTextTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "А вот что получится, если\nчитать справа налево"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#111111")
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    let revercedTextDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#4CD866")
        button.setTitleColor(UIColor(hex: "#FFFEFE"), for: .normal)
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubviews() {
        addSubview(startTextTitleLabel)
        addSubview(startTextDiscriptionLabel)
        addSubview(revercedTextTitleLabel)
        addSubview(revercedTextDiscriptionLabel)
        addSubview(startButton)
    }
}
