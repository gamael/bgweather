//
//  Repositoy.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 11/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import Foundation

protocol Repository {
    func getWeather(latitude lat: String, longitude lon: String, system: MetricalSystem, completion: @escaping (_ result: requestResult, _ data: Weather?) -> Void)
}

enum MetricalSystem: String {
    case metric = "metric"
    case imperial = "imperial"
}

enum requestResult {
    case ok
    case error
    case codableError
    case noConnection
}

class RepositoryImp: Repository {
    private struct Constants {
        static let APIKEY = "c6e381d8c7ff98f0fee43775817cf6ad"
        static let apiurl = "http://api.openweathermap.org/data/2.5/"
    }
    
    func getWeather(latitude lat: String, longitude lon: String, system: MetricalSystem = .metric, completion: @escaping (_ result: requestResult, _ data: Weather?) -> Void) {

        let requestURL = Constants.apiurl + "weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.APIKEY)&units=\(system.rawValue)"
        let session = URLSession.shared
        let url = URL(string: requestURL)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            guard error == nil else {
                completion(.error, nil)
                return
            }
            guard let data = data else {
                completion(.error, nil)
                return
            }
            do {
                let weather = try Weather.decode(from: data)
                completion(.ok, weather)
            } catch (let error) {
                print(error)
                completion(.codableError, nil)
            }
        })
        task.resume()
    }
}
