//
//  SearchCollectionViewCellItem.swift
//  Translator
//
//  Created by Ivan Zakharov on 8/9/21.
//

import Foundation
import UIKit

final class SearchCollectionViewCellItem: CollectionViewDiffCellItem {
    
    private typealias Cell = SearchCollectionViewCell
    
    let diffIdentifier: String
    
    let reuseType: ReuseType = .class(Cell.self)
    
    private var text: String
    
    init(text: String) {
        self.text = text
        diffIdentifier = UUID().uuidString
    }
    
    func configure(_ cell: UICollectionViewCell) {
        guard let cell = cell as? Cell else {
            return
        }
        cell.refreshContent(text)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
    }
    
    func size(in collectionView: UICollectionView, sectionItem: CollectionViewSectionItem) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 66)
    }
    
    func isEqual(to item: DiffItem) -> Bool {
        guard let rhs = item as? SearchCollectionViewCellItem else {
            return false
        }
        
        let lhs = self
        return lhs.diffIdentifier == rhs.diffIdentifier &&
            lhs.text == rhs.text
    }
}
