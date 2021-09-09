//
//  DeatailModule.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation

protocol DetailModuleInput: AnyObject {
}

protocol DetailModuleOutput: AnyObject {
    func detailModuleSearchModuleShow(_ moduleInput: DetailModuleInput)
}

final class DetailModule {

    var input: DetailModuleInput {
        return presenter
    }
    var output: DetailModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: DetailViewController
    private let presenter: DetailPresenter

    init(state: DetailState = .init()) {
        let presenter = DetailPresenter(state: state)
        let viewController = DetailViewController(output: presenter)
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
