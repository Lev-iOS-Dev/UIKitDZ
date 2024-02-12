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
        return view
    }
}
