// CustomControlVIew.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol FilterDataSource {
    func filterStatesCount(_ filter: Filter) -> Int
    func filterChangeAppearance(_ filter: Filter, indexPath: IndexPath) 
}

/// Кастомный вью
class Filter: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
