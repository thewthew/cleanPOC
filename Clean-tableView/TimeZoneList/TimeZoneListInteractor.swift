//
//  TimeZoneListInteractor.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol TimeZoneListInteractorInput: class {
    func loadContent()
}

final class TimeZoneListInteractor {
    var presenter: TimeZoneListPresenterInput? {
        didSet { presenter?.modelUpdated(model) }
    }

    var model = TimeZoneListModel()

    init(presenter: TimeZoneListPresenterInput?) {
        self.presenter = presenter
    }
    
}

extension TimeZoneListInteractor: TimeZoneListInteractorInput {
    func loadContent() {
        print("startloading")
        APIClient.getZone("http://api.timezonedb.com/v2.1/list-time-zone?key=HEG8FEDU4DE3&format=json", completion: { [unowned self] (zoneList) in
            self.model.zonesList = zoneList
            self.presenter?.modelUpdated(self.model)
        })
    }
}
