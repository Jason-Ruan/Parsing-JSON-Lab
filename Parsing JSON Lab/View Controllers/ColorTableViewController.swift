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
        let colorComponentValues = color.rgb.fraction
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = color.name.value
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(colorComponentValues.r), green: CGFloat(colorComponentValues.g), blue: CGFloat(colorComponentValues.b), alpha: 1)
        //change color of cell text to make for readable
        if colorComponentValues.r + colorComponentValues.g + colorComponentValues.b >= 0.5 {
            cell.textLabel?.textColor = UIColor.white
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorDetailViewController else { fatalError("Could not access detail view controller") }
        let selectedRow = self.tableView.indexPathForSelectedRow
        colorVC.color = colors[selectedRow!.row]
    }

}
