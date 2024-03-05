// PrepareForAutolayout.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Скоро будет
public func prepareForAutoLayout<T: UIView>(_ view: T) -> T {
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}
