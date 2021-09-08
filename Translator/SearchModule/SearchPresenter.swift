//
//  SearchPresenter.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation

final class SearchPresenter {
    
    weak var view: SearchViewController?
    weak var output: SearchModuleOutput?
    init(state: SearchState) {
        
    }
}

extension SearchPresenter: SearchViewOutput {
    func showDetailScreen() {
        output?.searchModuleDetailModuleShow(self)
    }
}

extension SearchPresenter: SearchModuleInput {
    
}
