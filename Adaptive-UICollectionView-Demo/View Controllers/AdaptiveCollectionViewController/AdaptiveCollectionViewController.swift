//
//  AdaptiveCollectionViewController.swift
//  Adaptive-UICollectionView-Demo
//
//  Created by Seb Vidal on 26/02/2024.
//

import UIKit

class AdaptiveCollectionViewController: UICollectionViewController {
    // MARK: - init(collectionViewLayout:)
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = "Item \(indexPath.item + 1)"
        contentConfiguration.secondaryText = "Secondary Text"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
    
    // MARK: - traitCollectionDidChange(_:)
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass else { return }
        collectionView.setCollectionViewLayout(.adaptiveLayout(for: traitCollection), animated: true)
    }
}
