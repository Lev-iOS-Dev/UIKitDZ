// UIColor+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для UIColor, реализующее паттерн "Легковес" в целях экономии памяти
extension UIColor {
    /// Статическая переменная, которая хранит словарь шрифтов, используемых в приложении
    static var colorsStoreMap: [String: UIColor] = [:]

    /// Статический метод, который возвращает цвет, если он уже есть в словаре, либо сначала добавляет его в словарь, а
    /// затем возвращает его нам
    /// - Parameter red: значение для цветового канал Red
    /// - Parameter green: значение для цветового канала Green
    /// - Parameter blue: значение для цветового канала Blue
    /// - Parameter alpha: значение для канала прозрачности Alpha
    /// - Returns: экземпляр UIColor
    class func rgba(
        _ red: CGFloat,
        _ green: CGFloat,
        _ blue: CGFloat,
        _ alpha: CGFloat
    ) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        if let color = colorsStoreMap[key] {
            return color
        }

        let color = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
        colorsStoreMap[key] = color
        return color
    }
}
