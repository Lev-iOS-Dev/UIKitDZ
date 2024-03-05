// UIFont+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для UIColor, реализующее паттерн "Легковес" в целях экономии памяти
extension UIFont {
    /// Статическая переменная, которая хранит словарь шрифтов, используемых в приложении
    static var fontsStoreMap: [String: UIFont] = [:]

    /// Статический метод, который возвращает шрифт, если он уже есть в словаре, либо сначала добавляет его в словарь, а
    /// затем возвращает его нам
    /// - Parameter fontName: имя шрифта
    /// - Parameter fontSize: размер шрифта
    /// - Returns: экземпляр UIFont
    class func myFont(
        fontName: String,

        fontSize: CGFloat
    ) -> UIFont {
        let key = "\(fontName)\(fontSize)"
        if let font = fontsStoreMap[key] {
            return font
        }

        guard let font = UIFont(
            name: fontName,
            size: fontSize
        ) else { return UIFont() }
        fontsStoreMap[key] = font
        return font
    }
}
