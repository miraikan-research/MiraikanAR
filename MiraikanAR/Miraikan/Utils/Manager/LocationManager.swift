//
//  LocationManager.swift
//  MiraikanAR
//
//  Created by yoshizawr204 on 2022/12/05.
//

import Foundation

// Singleton
final public class LocationManager: NSObject {
    
    public static let shared = LocationManager()

    var lat: Double = 0
    var lng: Double = 0
    var floor: Double = 0

    private override init() {
        super.init()
    }

    func setLocation(url: URL) {
//        NSLog("\(url.absoluteString)")
        if let urlComponents = URLComponents(string: url.absoluteString),
           let queryItems = urlComponents.queryItems {

            for query in queryItems {
                if let value = query.value,
                   let value = Double(value) {
                    if query.name == "floor" {
                        self.floor = value
                    } else if query.name == "lat" {
                        self.lat = value
                    } else if query.name == "lng" {
                        self.lng = value
                    }
                }
            }
        }
    }
}
