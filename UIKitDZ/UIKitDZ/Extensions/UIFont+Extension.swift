// UIFont+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Add fonts, corresponding to app
public extension UIFont {
    
    static func makeVerdanaBold16() -> UIFont? {
        UIFont(name: "Verdana-bold", size: 16)
    }

    static func makeVerdanaBold10() -> UIFont? {
        UIFont(name: "Verdana-bold", size: 10)
    }

    static func makeVerdana16() -> UIFont? {
        UIFont(name: "Verdana", size: 16)
    }
}
