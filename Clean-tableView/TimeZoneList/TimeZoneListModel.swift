//
//  TimeZoneListModel.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation
import SwiftyJSON

internal struct TimeZoneListModel {
    var zonesList : [Zone]?
}

struct Zone {
    var countryName : String
    var countryCode : String
    var zoneName : String
    var gmtOffset : Int
    var timestamp : Int
}
