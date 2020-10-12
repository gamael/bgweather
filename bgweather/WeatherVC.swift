//
//  WeatherVC.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 11/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import UIKit
import MapKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var rainChances: UILabel!
    @IBOutlet weak var wind: UILabel!
    
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D() {
        didSet {
            performUpdateUI()
        }
    }
    var repository: Repository?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func performUpdateUI() {
        let latitude = "\(location.latitude)"
        let longitude = "\(location.longitude)"
        repository?.getWeather(latitude: latitude, longitude: longitude ,system: .metric, completion: { [weak self] (res, data) in
            switch res {
            case .ok:
                guard let data = data else {
                    print("Error")
                    return
                }
                self?.updateUI(weather: data)
            case .error:
                print("Error")
            case .codableError:
                print("Error coding data")
            case .noConnection:
                print("No internet connection")
            }
        })
    }
    
    private func updateUI(weather: Weather) {
        DispatchQueue.main.async {
            self.temperature.text = "\(weather.main.temp)"
            self.humidity.text = "\(weather.main.humidity)"
            self.rainChances.text = "\(weather.wind.speed) -- \(weather.wind.deg)"
        }
    }
}

