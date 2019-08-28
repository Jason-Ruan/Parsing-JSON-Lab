//
//  RandomUserTableViewController.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class RandomUserTableViewController: UITableViewController {
    
    var randomUsers = [RandomUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = randomUsers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
    private func loadUserData() {
        guard let pathToRandomUserJSONFile = Bundle.main.path(forResource: "RandomUser", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
        
        let urlUsers = URL(fileURLWithPath: pathToRandomUserJSONFile)
        do {
            let dataUsers = try Data(contentsOf: urlUsers)
            randomUsers = try RandomUser.getRandomUser(from: dataUsers)
        } catch {
            fatalError("Could not get data from json file")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userVC = segue.destination as? UserDetailViewController else { fatalError("Could not access detail view controller") }
        let selectedRow = self.tableView.indexPathForSelectedRow
        userVC.user = randomUsers[selectedRow!.row]
    }
}
