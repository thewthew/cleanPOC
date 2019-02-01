//
//  NewTemplateDetailZonePresenter.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 01/02/2019.
//  Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol NewTemplateDetailZonePresenterInput: class {
    func modelUpdated(_ model: Zone)
}

final class NewTemplateDetailZonePresenter {
    weak var viewController: NewTemplateDetailZoneViewControllerInput?

    init(viewController: NewTemplateDetailZoneViewControllerInput?) {
        self.viewController = viewController
    }
}

extension NewTemplateDetailZonePresenter: NewTemplateDetailZonePresenterInput {
    func modelUpdated(_ model: Zone) {
        var viewModel = NewTemplateDetailZoneViewModel()

        let date = Date(timeIntervalSince1970: Double(model.timestamp))

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeString = dateFormatter.string(from: date)

        viewModel.date = "On est le \(dateString) à \(timeString) "
        viewModel.zoneString = "dans le \(model.zoneName)"
        viewController?.viewModelUpdated(viewModel)
    }
}
