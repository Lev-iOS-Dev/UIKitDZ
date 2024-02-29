// FavoritesPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Презентер для экрана с избранными
final class FavoritesPresenter {
    // MARK: - Private Properties

    private weak var favortiesCoordinator: FavoritesCoordinator?
    private weak var view: UIViewController?

    // MARK: - Initializers

    init(view: UIViewController, coordinator: FavoritesCoordinator) {
        self.view = view
        favortiesCoordinator = coordinator
    }
}
