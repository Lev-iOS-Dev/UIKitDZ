// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Интерфейс взаимодействия с view
protocol ProfilePresenterProtocol {
    /// Координатор, который мы иньектим из главного координатора
    var profileCoordinator: ProfileCoordinator? { get set }
    /// Показывает во вью алерт  со сменой имени
    func showNameChangeAlert()
    /// Показывает во вью алерт с выходом из учетной записи
    func showLogoutAlert()
    /// Просит координатора выйти из учетной записи
    func logout()
    /// Просит координатора перейти на экран с политикой конфиденциальности
    func pushTermsOfUse()
    /// Просит координатора показать экран с бонусами
    func pushBonusView()
    /// Загружает данные ячеек  из модели
    func loadInfo() -> ProfileStorage
    /// Загружает типы ячеек из модели
    func loadProfileCellTypes() -> [ProfileCellTypes]
}

/// Презентер  профиля
final class ProfilePresenter {
    // MARK: - Public Properties

    weak var profileCoordinator: ProfileCoordinator?

    // MARK: - Private Properties

    private weak var view: ProfileViewControllerProtocol?

    // MARK: - Initializers

    init(view: ProfileViewControllerProtocol) {
        self.view = view
    }
}

// MARK: - ProfilePresenter + ProfilePresenterProtocol

extension ProfilePresenter: ProfilePresenterProtocol {
    func loadProfileCellTypes() -> [ProfileCellTypes] {
        ProfileCellTypes.fetchCellTypes()
    }

    func loadInfo() -> ProfileStorage {
        ProfileStorage.fetchInfo()
    }

    func showNameChangeAlert() {
        guard let profileViewController = view as? ProfileViewController else { return }
        profileViewController.showNameChangeAlert()
    }

    func showLogoutAlert() {
        guard let profileViewController = view as? ProfileViewController else { return }
        profileViewController.showLogoutAlert()
    }

    func logout() {
        profileCoordinator?.logout()
    }

    func pushTermsOfUse() {
        profileCoordinator?.pushTermsOfUseView()
    }

    func pushBonusView() {
        profileCoordinator?.pushBonusView()
    }
}
