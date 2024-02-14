// UIView + extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension to add several subviews separated by comma
public extension UIView {
    // Function to add several subviews separated by comma
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }

    func createWhiteView(height: CGFloat = 564) -> UIView {
        let yPosition = frame.height - height
        let view = UIView(frame: CGRect(x: 0, y: yPosition, width: frame.width, height: height))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }

    func createBlackVerdanaLabel(size: CGFloat, text: String, yPosition: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: yPosition, width: 0, height: 0))
        label.text = text
        label.textColor = .black
        label.font = UIFont(name: "Verdana-bold", size: size)
        label.sizeToFit()
        return label
    }

    // Function to underline the view
    func addGrayLineToBottom() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: bounds.height + 10, width: UIScreen.main.bounds.width - 40, height: 1)
        bottomLayer.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(bottomLayer)
    }

    // Creates custom textField with desired parameters
    func createCustomTextField(placeholder: String, yPosition: CGFloat) -> UITextField {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: yPosition,
            width: UIScreen.main.bounds.width - 40,
            height: 17
        ))
        textField.placeholder = placeholder
        textField.addGrayLineToBottom()
        return textField
    }
}
