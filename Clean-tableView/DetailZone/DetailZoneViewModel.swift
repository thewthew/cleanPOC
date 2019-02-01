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
        if let timeStampInt = model.zone?.timestamp {

            let date = Date(timeIntervalSince1970: Double(timeStampInt))

            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "fr_FR")
            dateFormatter.dateStyle = .medium
            let dateString = dateFormatter.string(from: date)

            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "HH:mm:ss"
            let timeString = dateFormatter2.string(from: date)

            return "On est le \(dateString) à \(timeString) "
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
