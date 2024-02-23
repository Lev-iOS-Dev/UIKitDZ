// PrepareForAutolayout.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

public func prepareForAutolayout<T: UIView>(_ view: T) -> T {
    view.translatesAutoresizingMaskIntoConstraints = false

    return view
}
