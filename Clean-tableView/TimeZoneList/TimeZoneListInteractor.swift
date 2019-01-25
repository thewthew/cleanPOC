//
//  TimeZoneListInteractor.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol TimeZoneListInteractorInput: class {
    func loadContent()
}

final class TimeZoneListInteractor {
    var presenter: TimeZoneListPresenterInput? {
        didSet { presenter?.modelUpdated(model) }
    }

    var model: TimeZoneListModel!

    init(presenter: TimeZoneListPresenterInput?) {
        self.presenter = presenter
    }
    
}

extension TimeZoneListInteractor: TimeZoneListInteractorInput {
    func loadContent() {
        
    }
}
