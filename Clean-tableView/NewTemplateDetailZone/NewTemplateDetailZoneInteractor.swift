//
//  NewTemplateDetailZoneInteractor.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 01/02/2019.
//  Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

protocol NewTemplateDetailZoneInteractorInput: class {
    func loadContent(zonename : String)
}

final class NewTemplateDetailZoneInteractor {
    var presenter: NewTemplateDetailZonePresenterInput?

    init(presenter: NewTemplateDetailZonePresenterInput?) {
        self.presenter = presenter
    }
    
}

extension NewTemplateDetailZoneInteractor: NewTemplateDetailZoneInteractorInput {
    func loadContent(zonename : String) {
        APIClient.getZoneDetail("http://api.timezonedb.com/v2.1/get-time-zone?key=HEG8FEDU4DE3&format=json&by=zone&zone=\(zonename)", completion: { [unowned self]  (zone) in
            self.presenter?.modelUpdated(zone)
        })
    }
}
