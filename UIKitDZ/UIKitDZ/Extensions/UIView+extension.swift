// UIView+extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension to add several subviews separated by comma
extension UIView {
    // Function to add several subviews separated by comma
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }
}
