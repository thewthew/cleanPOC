//
//  DetailZoneViewModel.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

/// `DetailZoneViewModel` is a struct used by `DetailZoneViewModelViewController` to display content to the user.
internal struct DetailZoneViewModel {
    /// Reference to the internal model.
    private let model: DetailZoneModel

    var presentTime : String? {
        if let formattedString = model.zone?.formatted {

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy"
            dateFormatterPrint.timeZone = TimeZone(identifier: "UTC")

            guard let date = dateFormatter.date(from: formattedString) else { return nil }

//            guard let date2 = dateFormatterPrint.date(from: formattedString) else { return nil }

            return "On est le \(date) à \(formattedString)"
        }
        return nil
    }

    var presentZone : String? {
        if let zoneName = model.zone?.zoneName {
            return "dans le fuseau \(zoneName)"
        }
        return nil
    }
    /// Initializes the receiver from the given model.
    ///
    /// - Parameter model: The model to reference.
    init(from model: DetailZoneModel) {
        self.model = model
    }
}
