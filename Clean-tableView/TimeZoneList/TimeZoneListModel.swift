//
//  TimeZoneListModel.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 25/01/2019.
//Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation

internal struct TimeZoneListModel {
    var zonesList : [Zone]?
}

struct Zone {
    var countryName : String
    var countryCode : String
    var zoneName : String
    var gmtOffset : Int
    var timestamp : Int

    var abbreviation : String?
    var dst : String?
    var zoneStart : String?
    var zoneEnd : String?
    var nextAbbreviation : String?
    var formatted : String?
}
