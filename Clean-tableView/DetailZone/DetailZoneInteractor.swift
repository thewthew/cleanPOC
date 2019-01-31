//
//  DetailZoneInteractor.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol DetailZoneInteractorInput: class {
    func loadContent(zonename : String)
}

final class DetailZoneInteractor {
    var presenter: DetailZonePresenterInput? {
        didSet { presenter?.modelUpdated(model) }
    }

    var model = DetailZoneModel()

    init(presenter: DetailZonePresenterInput?) {
        self.presenter = presenter
    }
    
}

extension DetailZoneInteractor: DetailZoneInteractorInput {
    func loadContent(zonename : String) {
        print("startloading detail \(zonename)")
        APIClient.getZoneDetail("http://api.timezonedb.com/v2.1/get-time-zone?key=HEG8FEDU4DE3&format=json&by=zone&zone=\(zonename)", completion: { [unowned self]  (zone) in
            self.model.zone = zone
            self.presenter?.modelUpdated(self.model)
        })
        presenter?.modelUpdated(model)
    }
}
