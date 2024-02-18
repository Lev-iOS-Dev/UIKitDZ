// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Adding usefull functions to UIVIew
public extension UIView {
    /// Add several subviews separated by comma
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }

    /// Making white color view and place at the bottom of general view
    func makeBottomWhiteView(height: CGFloat) -> UIView {
        let yPosition = frame.height - height
        let view = UIView(frame: CGRect(x: 0, y: yPosition, width: frame.width, height: height))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }

    /// Make reusable label with Verdana bold font
    ///  - Parameter yPosition: position on Y axis from the top of general view
    func makeBlackVerdanaLabel(size: CGFloat, text: String, yPosition: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: yPosition, width: 0, height: 0))
        label.text = text
        label.textColor = .black
        label.font = UIFont(name: "Verdana-bold", size: size)
        label.sizeToFit()
        return label
    }

    /// Underline the view
    func addGrayLineToBottom() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: bounds.height + 10, width: UIScreen.main.bounds.width - 40, height: 1)
        bottomLayer.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(bottomLayer)
    }

    /// Creates custom textField with desired parameters
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
