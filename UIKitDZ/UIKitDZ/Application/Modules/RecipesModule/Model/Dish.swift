// Dish.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// все блюда данной категории
struct Dish {
    // название блюда
    let dishName: String
    // картинка для блюда
    let dishImageName: String
    // время приготовления
    let cookTime: String
    // суммарное количество колорий
    let coloriesSum: String
    // количество калорий
    let nutrients: Nutrients
    // рецепт приготовления
    let recipe: String
}
