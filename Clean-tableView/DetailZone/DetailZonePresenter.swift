//
//  DetailZonePresenter.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol DetailZonePresenterInput: class {
    func modelUpdated(_ model: DetailZoneModel)
}

final class DetailZonePresenter {
    weak var viewController: DetailZoneViewControllerInput?

    init(viewController: DetailZoneViewControllerInput?) {
        self.viewController = viewController
    }
}

extension DetailZonePresenter: DetailZonePresenterInput {
    func modelUpdated(_ model: DetailZoneModel) {
        let viewModel = DetailZoneViewModel(from: model)
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
