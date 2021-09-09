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
    func showDetailScreen(text: String, meanings: [Meaning?]) {
        output?.searchModuleDetailModuleShow(self, text: text, meanings: meanings)
    }
}

extension SearchPresenter: SearchModuleInput {
    
}
