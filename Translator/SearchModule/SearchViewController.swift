//
//  SearchViewController.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation
import UIKit
import Framezilla
import Kingfisher

protocol SearchViewOutput {
    func showDetailScreen(text: String, meanings: [Meaning?])
}

final class SearchViewController: UIViewController {
    
    private struct Constants {
        static let headerImageHeight: CGFloat = 60
        static let backButtonInsetLeft: CGFloat = 10
        static let backButtonSize: CGSize = .init(width: 40, height: 40)
    }
    
    private let output: SearchViewOutput
    var meanings: [MeaningsModel] = []
    private let networkService = NetworkService()
    
    // MARK: - Subviews
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textChange), for: .editingChanged)
        return textField
    }()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    lazy var manager = CollectionViewManager(collectionView: collectionView)
    
    
    // MARK: - Lifecycle
    
    init(output: SearchViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        view.add(searchTextField, collectionView)
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
    }
    
    // MARK: - Layout
    
    override func viewDidLayoutSubviews() {
        searchTextField.configureFrame { maker in
            maker.top(to: view.nui_safeArea.top, inset: 10)
                .left(to: view.nui_left, inset: 30)
                .right(to: view.nui_right, inset: 30)
                .height(40)
        }
        
        collectionView.configureFrame { maker in
            maker.top(to: searchTextField.nui_bottom, inset: 20)
                .right()
                .left()
                .bottom()
        }
    }
    
    private func update() {
        let cellItems = meanings.compactMap { meaning -> SearchCollectionViewCellItem? in
            guard let title = meaning.text else {
                return nil
            }
            let item = SearchCollectionViewCellItem(text: title)
            item.itemDidSelectHandler = { _ in
                self.output.showDetailScreen(text: title, meanings: meaning.meanings)
            }
            return item
        }
        let sectionItem = GeneralCollectionViewDiffSectionItem(cellItems: cellItems)
        sectionItem.insets.top = 10
        sectionItem.minimumLineSpacing = 10
        manager.update(with: [sectionItem], animated: true)
    }
    
    @objc private func textChange() {
        guard let text = searchTextField.text else {
            return
        }
        networkService.getTranslate(word: text) { result in
            switch result {
            case .success(let responce):
                self.meanings = responce
                self.update()
            case .failure(_):
                break
            }
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
