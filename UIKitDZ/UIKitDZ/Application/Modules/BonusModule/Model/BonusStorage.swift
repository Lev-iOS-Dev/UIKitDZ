// BonusStorage.swift
// Copyright © RoadMap. All rights reserved.

///  Хранилище данных об экране с бонусами
struct BonusStorage {
    // MARK: - Constants

    enum Constants {
        static let bonusesCount = "100"
    }

    let bonusInfo = BonusInfo(bonusesCount: Constants.bonusesCount)
}
