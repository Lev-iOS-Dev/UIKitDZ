// Categories.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Категории всех возмоюных рецептов
struct Categories {
    // название категории
    let categoryName: String
    // картинка для категории
    let categoryImageName: String
    // массив блюд для данной категории
    let dishes: [Dish]
}
