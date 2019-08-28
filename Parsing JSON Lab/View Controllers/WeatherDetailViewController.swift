//
//  WeatherDetailViewController.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var cityWeatherInfo: Weather!

    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        cityName.text = cityWeatherInfo.name
        tempLabel.text = "\(cityWeatherInfo.main.temp)\u{00B0}C"
        weatherLabel.text = cityWeatherInfo.weather[0].description
    }

}
