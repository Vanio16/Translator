//
//  DetailPresenter.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation

final class DetailPresenter {

    weak var view: DetailViewController?
    weak var output: DetailModuleOutput?
    init(state: DetailState) {

    }
}

extension DetailPresenter: DetailViewOutput {
    func goBack() {
        output?.detailModuleSearchModuleShow(self)
    }
    

}

extension DetailPresenter: DetailModuleInput {

}
