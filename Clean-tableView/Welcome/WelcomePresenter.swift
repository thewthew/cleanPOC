//
//  WelcomePresenter.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol WelcomePresenterInput: class {
    func modelUpdated(_ model: WelcomeModel)
}

final class WelcomePresenter {
    weak var viewController: WelcomeViewControllerInput?

    init(viewController: WelcomeViewControllerInput?) {
        self.viewController = viewController
    }
}

extension WelcomePresenter: WelcomePresenterInput {
    func modelUpdated(_ model: WelcomeModel) {
        let viewModel = WelcomeViewModel(from: model)
        let block: () -> Void = { [weak self] in
            self?.viewController?.viewModelUpdated(viewModel)
        }
        if Thread.isMainThread {
            block()
            return
        }
        DispatchQueue.main.async(execute: block)
    }
}
