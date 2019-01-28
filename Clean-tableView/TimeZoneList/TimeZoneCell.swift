//
//  TimeZoneCell.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 28/01/2019.
//  Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class TimeZoneCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!

    var zone : Zone? {
        didSet {
            setup()
        }
    }

    func setup(){
        let countryName = zone?.countryName
        countryNameLabel.text = countryName
    }
}
