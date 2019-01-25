//
//  DetailZoneInteractor.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol DetailZoneInteractorInput: class {
    func loadContent()
}

final class DetailZoneInteractor {
    var presenter: DetailZonePresenterInput? {
        didSet { presenter?.modelUpdated(model) }
    }

    var model: DetailZoneModel!

    init(presenter: DetailZonePresenterInput?) {
        self.presenter = presenter
    }
    
}

extension DetailZoneInteractor: DetailZoneInteractorInput {
    func loadContent() {
        
    }
}
