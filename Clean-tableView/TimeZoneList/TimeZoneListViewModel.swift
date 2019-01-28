//
//  TimeZoneListViewModel.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation
import SwiftyJSON

/// `TimeZoneListViewModel` is a struct used by `TimeZoneListViewModelViewController` to display content to the user.
internal struct TimeZoneListViewModel {
    /// Reference to the internal model.
    private let model: TimeZoneListModel

    var countryCode : String? {
        return model.countryMode
    }

    var countryName : String? {
        return model.zonesArray?[0]["countryName"].stringValue
    }

    var zoneName : String? {
        return model.zoneName
    }

    var gmtOffset : Int? {
        return model.gmtOffset
    }

    var timestamp : Int? {
        return model.timestamp
    }
    
    var zonesArray : [JSON]? {
        return model.zonesArray
    }

    /// Initializes the receiver from the given model.
    ///
    /// - Parameter model: The model to reference.
    init(from model: TimeZoneListModel) {
        self.model = model
    }
}
