//
//  View + extension.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 12.02.24.
//

import UIKit

/// Extension to add several subviews separated by comma
public extension UIView {
    // Function to add several subviews separated by comma
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }
}
