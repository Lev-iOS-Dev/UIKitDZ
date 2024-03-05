// SortingStates.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: Public Properties

/// Состояния кнопок сортировки
public enum SortingStates {
    /// Кнопка не нажата
    case none
    /// Кнопка нажата на режим с меньшего значения к большему
    case lowToHigh
    /// Кнопка нажата на режим с большего значения к меньшему
    case highToLow
}
