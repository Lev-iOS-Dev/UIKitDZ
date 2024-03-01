// States.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: Public Properties

/// Состояния кнопок сортировки
public enum States {
    /// Кнопка не нажата
    case none
    /// Кнопка нажата на режим с маленького значения к большому
    case lowToHigh
    /// Кнопка нажата на режим с большого значения к маленькому
    case highToLow
}
