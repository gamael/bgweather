//
//  Entities.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 11/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var weather: [CurrentWeather]
    var main: Main
    var wind: Wind
}

struct CurrentWeather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}


struct Main: Codable {
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
}

struct Wind: Codable {
    var speed: Float
    var deg: Float
}


