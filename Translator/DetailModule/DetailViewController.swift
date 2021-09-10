//
//  DetailViewController.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation
import UIKit
import Framezilla
import Kingfisher

protocol DetailViewOutput {
    func backButtonPressed()
}

final class DetailViewController: UIViewController {
    
    private struct Constants {
        static let headerImageHeight: CGFloat = 60
        static let backButtonInsetLeft: CGFloat = 10
        static let backButtonSize: CGSize = .init(width: 40, height: 40)
    }
    
    private let output: DetailViewOutput
    
    // MARK: - Subviews
    let textLabel = UILabel()
    let backButton: UIButton = {
       let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.addTarget(self, action: #selector(backButtonTriggered), for: .touchUpInside)
        return button
    }()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    lazy var manager = CollectionViewManager(collectionView: collectionView)
    
    // MARK: - Lifecycle
    
    init(output: DetailViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        collectionView.backgroundColor = .white
        view.add(textLabel, backButton, collectionView)
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        textLabel.configureFrame { maker in
            maker.top(to: view.nui_safeArea.top, inset: 20)
                .left(inset: 16)
                .right()
                .heightToFit()
        }
        
        backButton.configureFrame { maker in
            maker.top(to: view.nui_safeArea.top, inset: 3)
                .right(inset: 5)
                .sizeToFit()
        }
        
        collectionView.configureFrame { maker in
            maker.top(to: textLabel.nui_bottom, inset: 20)
                .right()
                .left()
                .bottom()
        }
    }
    
    func update(text: String, meanings: [Meaning?]) {
        textLabel.text = text
        let cellItems = meanings.compactMap { meaning -> DetailCollectionViewCellItem? in
            guard let title = meaning?.translation?.text else {
                return nil
            }
            let item = DetailCollectionViewCellItem(text: title, url: meaning?.imageUrl ?? "")
            return item
        }
        let sectionItem = GeneralCollectionViewDiffSectionItem(cellItems: cellItems)
        sectionItem.insets = .init(top: 10, left: 10, bottom: 1, right: 10)
        sectionItem.minimumLineSpacing = 10
        manager.update(with: [sectionItem], animated: true)
    }
    @objc private func backButtonTriggered() {
        output.backButtonPressed()
    }
}
