//
//  APIClient.swift
//  Clean-tableView
//
//  Created by Matthew Usdin on 28/01/2019.
//  Copyright © 2019 Matthew Usdin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct APIClient {

    static func getZone(_ path :String, completion: @escaping ([Zone]) -> Void) {

        if let url = URL(string: path) {
            let urlRequest = URLRequest(url: url)

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) -> Void in

                if let data = data {
                    do {
                        print("data list is loaded")
                        let json = try JSON(data: data)
                        completion(parsingListZoneJSON(json))

                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    static func getZoneDetail(_ path :String, completion: @escaping (Zone) -> Void) {

        if let url = URL(string: path) {
            let urlRequest = URLRequest(url: url)

            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) -> Void in

                if let data = data {
                    do {
                        print("data detail is loaded")
                        let json = try JSON(data: data)
                        completion(parsingDetailZoneJSON(json))

                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    static func parsingListZoneJSON(_ json: JSON) -> [Zone] {

        var listZone = [Zone]()
        if let items = json["zones"].array {
            for item in items {
                let zone = Zone(countryName: item["countryName"].stringValue,
                                countryCode: item["countryCode"].stringValue,
                                zoneName: item["zoneName"].stringValue,
                                gmtOffset: item["gmtOffset"].intValue,
                                timestamp: item["timestamp"].intValue,
                                abbreviation: item["abbreviation"].stringValue,
                                dst: item["dst"].stringValue,
                                zoneStart: item["zoneStart"].stringValue,
                                zoneEnd: item["zoneEnd"].stringValue,
                                nextAbbreviation: item["nextAbbreviation"].stringValue,
                                formatted: item["formatted"].stringValue)
                listZone.append(zone)
            }
        }
        return listZone
    }

    static func parsingDetailZoneJSON(_ json: JSON) -> Zone {

        let zone = Zone(countryName: json["countryName"].stringValue,
                        countryCode: json["countryCode"].stringValue,
                        zoneName: json["zoneName"].stringValue,
                        gmtOffset: json["gmtOffset"].intValue,
                        timestamp: json["timestamp"].intValue,
                        abbreviation: json["abbreviation"].stringValue,
                        dst: json["dst"].stringValue,
                        zoneStart: json["zoneStart"].stringValue,
                        zoneEnd: json["zoneEnd"].stringValue,
                        nextAbbreviation: json["nextAbbreviation"].stringValue,
                        formatted: json["formatted"].stringValue)
        return zone
    }
}
