//
//  TimeZoneListPresenter.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol TimeZoneListPresenterInput: class {
    func modelUpdated(_ model: TimeZoneListModel)
}

final class TimeZoneListPresenter {
    weak var viewController: TimeZoneListViewControllerInput?

    init(viewController: TimeZoneListViewControllerInput?) {
        self.viewController = viewController
    }
}

extension TimeZoneListPresenter: TimeZoneListPresenterInput {
    func modelUpdated(_ model: TimeZoneListModel) {
        let viewModel = TimeZoneListViewModel(from: model)
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
