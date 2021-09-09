//
//  DetailCollectionViewCellItem.swift
//  Translator
//
//  Created by Ivan Zakharov on 8/9/21.
//

import Foundation
import UIKit

final class DetailCollectionViewCellItem: CollectionViewDiffCellItem {
    
    private typealias Cell = DetailCollectionViewCell
    
    let diffIdentifier: String
    
    let reuseType: ReuseType = .class(Cell.self)
    
    private var text: String
    private var url: String
    
    init(text: String, url: String) {
        self.text = text
        self.url = url
        diffIdentifier = UUID().uuidString
    }
    
    func configure(_ cell: UICollectionViewCell) {
        guard let cell = cell as? Cell else {
            return
        }
        cell.refreshContent(text, imageUrl: url)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
    }
    
    func size(in collectionView: UICollectionView, sectionItem: CollectionViewSectionItem) -> CGSize {
        return CGSize(width: collectionView.frame.width - sectionItem.insets.left - sectionItem.insets.right, height: 66)
    }
    
    func isEqual(to item: DiffItem) -> Bool {
        guard let rhs = item as? DetailCollectionViewCellItem else {
            return false
        }
        
        let lhs = self
        return lhs.diffIdentifier == rhs.diffIdentifier &&
            lhs.text == rhs.text
    }
}
