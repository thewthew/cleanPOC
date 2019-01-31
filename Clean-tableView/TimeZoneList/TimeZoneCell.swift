//
//  TimeZoneCell.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 28/01/2019.
//  Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation
import UIKit

class TimeZoneCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var gmtLabel: UILabel!

    var zone : Zone? {
        didSet {
            setup()
        }
    }

    func setup(){
        let zoneName = zone?.zoneName
        countryNameLabel.text = zoneName
        gmtLabel.text = "\((zone?.countryName)!)"
    }
}
