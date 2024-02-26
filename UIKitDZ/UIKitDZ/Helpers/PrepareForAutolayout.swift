// PrepareForAutolayout.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// многоиспользуемий метод для установки
/// translatesAutoresizingMaskIntoConstraints в false
public func prepareForAutolayout<T: UIView>(_ view: T) -> T {
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}
