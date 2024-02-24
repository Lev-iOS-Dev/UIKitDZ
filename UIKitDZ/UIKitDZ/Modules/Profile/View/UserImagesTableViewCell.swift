// UserImagesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для показа опубликованных фотографий пользователя
final class UserImagesTableViewCell: UITableViewCell {
    // MARK: - Constsnts

    enum Constants {
        enum Insets {
            static let imageHeight: CGFloat = 125
            static let minSpacing: CGFloat = 2
        }
    }
    
    let identifier = "UserImagesTableViewCell"

    // MARK: - Visual Component

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = Constants.Insets.minSpacing
        layout.minimumLineSpacing = Constants.Insets.minSpacing
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        configureSubviews()
        configureCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Properties

    private var spaceImages: [SpaceImage] = []

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubview(collectionView)
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            collectionView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),
            collectionView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            collectionView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.imageHeight
            )
        ])
    }

    private func configureCollectionView() {
        collectionView.register(
            ImageCollectionViewCell.self,
            forCellWithReuseIdentifier: ImageCollectionViewCell().identifier
        )
    }

    // MARK: - Public Methodes

    func configureWith(data: [SpaceImage]) {
        spaceImages = data
        collectionView.reloadData()
    }
}

// MARK: - UserImagesTableViewCell + UICollectionViewDataSource

extension UserImagesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spaceImages.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ImageCollectionViewCell",
            for: indexPath
        ) as? ImageCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureWith(
            image: spaceImages[indexPath.row].image
        )

        return cell
    }
}

// MARK: - UserImagesTableViewCell + UICollectionViewDelegateFlowLayout

extension UserImagesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let numberOfColumns: CGFloat = 3
        let spacingBetweenCells: CGFloat = 1
        let totalSpacing = (2 * spacingBetweenCells) + ((numberOfColumns - 1) * spacingBetweenCells)
        let width = (collectionView.bounds.width - totalSpacing) / numberOfColumns
        return CGSize(
            width: width,
            height: Constants.Insets.imageHeight
        )
    }
}
