//
//  View + addsubviews.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 10.02.24.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutolayout($0) : $0) }
    }
}
