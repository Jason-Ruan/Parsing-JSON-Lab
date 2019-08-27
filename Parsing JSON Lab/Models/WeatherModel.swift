//
//  WeatherModel.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let name: String
    let main: MainWrapper
    let weather: [WeatherWrapper]
    
    static func getWeather(from data: Data) throws -> [Weather] {
        do {
            let weathers = try JSONDecoder().decode([Weather].self, from: data)
            return weathers
        } catch {
            throw JSONError.decodingError(error)
        }
    }
    
}

struct MainWrapper: Codable {
    let temp: Double
}

struct WeatherWrapper: Codable {
    let description: String
}
