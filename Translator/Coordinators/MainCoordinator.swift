//
//  MainCoordinator.swift
//  Translator
//
//  Created by Ivan Zakharov on 7/9/21.
//

import Foundation
import UIKit

final class MainCoordinator: SearchModuleOutput, DetailModuleOutput {
    let window: UIWindow
    var navigationController: UINavigationController
    let searchModule = SearchModule()
    let detailModule = DetailModule()

    init(window: UIWindow) {
        self.window = window
        navigationController = .init(rootViewController: searchModule.viewController)
        navigationController.navigationBar.isHidden = true
    }

    func start() {
        searchModule.output = self
        detailModule.output = self
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func searchModuleDetailModuleShow(_ moduleInput: SearchModuleInput, text: String, meanings: [Meaning?]) {
        detailModule.viewController.update(text: text, meanings: meanings)
        navigationController.pushViewController(detailModule.viewController, animated: true)
    }
    
    func detailModuleSearchModuleShow(_ moduleInput: DetailModuleInput) {
        navigationController.popViewController(animated: true)
    }
}
