// ProfilePresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Интерфейс взаимодействия с view
protocol ProfilePresenterProtocol {
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
    func loadProfileCellTypes() -> [ProfileCellType]
}

/// Презентер  профиля
final class ProfilePresenter {
    // MARK: - Private Properties

    private weak var profileCoordinator: ProfileCoordinator?
    private weak var view: ProfileViewControllerProtocol?

    // MARK: - Initializers

    init(view: ProfileViewControllerProtocol, coordinator: ProfileCoordinator) {
        self.view = view
        profileCoordinator = coordinator
    }
}

// MARK: - ProfilePresenter + ProfilePresenterProtocol

extension ProfilePresenter: ProfilePresenterProtocol {
    func loadProfileCellTypes() -> [ProfileCellType] {
        ProfileCellType.fetchCellTypes()
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
