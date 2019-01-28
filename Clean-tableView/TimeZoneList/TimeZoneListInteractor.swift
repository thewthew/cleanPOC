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
        if let url = URL(string: "http://api.timezonedb.com/v2.1/list-time-zone?key=HEG8FEDU4DE3&format=json") {
            let urlRequest = URLRequest(url: url)

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) -> Void in

                if let data = data {
                    do {
                        print("data is loaded")
                        let json = try JSON(data: data)
                        var listZone = [Zone]()

                        if let items = json["zones"].array {
                            for item in items {
                                let zone = Zone(countryName: item["countryName"].stringValue, countryCode: item["countryCode"].stringValue, zoneName: item["zoneName"].stringValue, gmtOffset: item["gmtOffset"].intValue, timestamp: item["timestamp"].intValue)
                                listZone.append(zone)
                            }
                            self.model.zonesList = listZone
                        }
                        self.presenter?.modelUpdated(self.model)

                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
