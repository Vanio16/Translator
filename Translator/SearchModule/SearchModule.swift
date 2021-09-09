//
//  SearchModule.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation

protocol SearchModuleInput: AnyObject {
    
}

protocol SearchModuleOutput: AnyObject {
    func searchModuleDetailModuleShow(_ moduleInput: SearchModuleInput, text: String, meanings: [Meaning?])
}

final class SearchModule {
    
    var input: SearchModuleInput {
        return presenter
    }
    var output: SearchModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: SearchViewController
    private let presenter: SearchPresenter
    
    init(state: SearchState = .init()) {
        let presenter = SearchPresenter(state: state)
        let viewController = SearchViewController(output: presenter)
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
