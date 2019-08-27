//
//  WeatherTableViewController.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    var cities = [Weather]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWeatherData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        cell.textLabel?.text = city.name
        return cell
    }
    
    private func loadWeatherData() {
        guard let pathToWeatherJSONFile = Bundle.main.path(forResource: "Weather", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
        
        let url = URL(fileURLWithPath: pathToWeatherJSONFile)
        do {
            let data = try Data(contentsOf: url)
            cities = try Weather.getWeather(from: data)
        } catch {
            fatalError("Could not get data from json file")
        }
    }
    
}
