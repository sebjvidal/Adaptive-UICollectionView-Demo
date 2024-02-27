//
//  UICollectionViewLayout+AdaptiveLayout.swift
//  Adaptive-UICollectionView-Demo
//
//  Created by Seb Vidal on 26/02/2024.
//

import UIKit

extension UICollectionViewLayout {
    static func adaptiveLayout(for traitCollection: UITraitCollection) -> UICollectionViewLayout {
        switch traitCollection.horizontalSizeClass {
        case .compact:
            let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
            let layout = UICollectionViewCompositionalLayout.list(using: configuration)
            
            return layout
        default:
            // https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 3), heightDimension: .estimated(70))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .fixed(4), trailing: .none, bottom: .fixed(4))
            group.interItemSpacing = .fixed(16)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            
            let layout = UICollectionViewCompositionalLayout(section: section)
            
            return layout
        }
    }
}
