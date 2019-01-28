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
    var zonesArray : [JSON]?

    var countryMode : String?
    var countryName : String?
    var zoneName : String?
    var gmtOffset : Int?
    var timestamp : Int?
}
