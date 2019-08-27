//
//  ColorTableViewController.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {

    var colors = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadColorData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = color.name.value
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1)
        return cell
    }
    
    private func loadColorData() {
        guard let pathToColorJSONFile = Bundle.main.path(forResource: "Color", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
        
        let urlColor = URL(fileURLWithPath: pathToColorJSONFile)
        do {
            let dataColor = try Data(contentsOf: urlColor)
            colors = try Color.getColor(from: dataColor)
        } catch {
            fatalError("Could not get data from json file")
        }
    }

}
