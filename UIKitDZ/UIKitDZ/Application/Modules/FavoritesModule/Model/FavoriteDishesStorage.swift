// FavoriteDishesStorage.swift
// Copyright © RoadMap. All rights reserved.

/// Источник данных для экранa избранных блюд
struct FavoriteDishesStorage {
    lazy var favorites: [Dish] = [
        Dish(
            dishName: Constants.dishName1,
            dishImageName: Constants.dishImageName1,
            cookTime: Constants.cookTime1,
            totalWeight: Constants.coloriesSum1,
            nutrients: Nutrients(
                enercKcal: Constants.EnercKcal1,
                carbohydrates: Constants.Carbohydrates1,
                fats: Constants.Fats1,
                proteins: Constants.Proteins1
            ),
            recipe: Constants.recipe
        ),
        Dish(
            dishName: Constants.dishName5,
            dishImageName: Constants.dishImageName5,
            cookTime: Constants.cookTime5,
            totalWeight: Constants.caloriesSum5,
            nutrients: Nutrients(
                enercKcal: Constants.EnercKcal5,
                carbohydrates: Constants.Carbohydrates5,
                fats: Constants.Fats5,
                proteins: Constants.Proteins5
            ),
            recipe: Constants.recipe
        )
    ]
}
