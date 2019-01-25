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

    var model = TimeZoneListModel()

    init(presenter: TimeZoneListPresenterInput?) {
        self.presenter = presenter
    }
    
}

extension TimeZoneListInteractor: TimeZoneListInteractorInput {
    func loadContent() {
        if let url = URL(string: "http://api.timezonedb.com/v2.1/list-time-zone?key=HEG8FEDU4DE3&format=json") {
            let urlRequest = URLRequest(url: url)

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) -> Void in

                if let data = data {
                    do {
                        let string = String(data: data, encoding: .utf8)
                        print("string is \(string)")

                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }

        presenter?.modelUpdated(model)
    }
}
