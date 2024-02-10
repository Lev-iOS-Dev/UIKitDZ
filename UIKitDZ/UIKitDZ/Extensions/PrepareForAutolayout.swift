//
//  PrepareForAutolayout.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 10.02.24.
//

import UIKit

public func prepareForAutolayout<T: UIView>(_ view: T) -> T {
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}
