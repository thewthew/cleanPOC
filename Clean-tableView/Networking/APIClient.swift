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
                        print("data is loaded")
                        let json = try JSON(data: data)
                        completion(parsingJSON(json))

                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }

    static func parsingJSON(_ json: JSON) -> [Zone] {

        var listZone = [Zone]()
        if let items = json["zones"].array {
            for item in items {
                let zone = Zone(countryName: item["countryName"].stringValue,
                                countryCode: item["countryCode"].stringValue,
                                zoneName: item["zoneName"].stringValue,
                                gmtOffset: item["gmtOffset"].intValue,
                                timestamp: item["timestamp"].intValue)
                listZone.append(zone)
            }
        }
        return listZone
    }
}
