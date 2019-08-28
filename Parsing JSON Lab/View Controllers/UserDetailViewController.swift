//
//  UserDetailViewController.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: RandomUser!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    private func setUpViews() {
        userName.text = "Name:      \(user.name.first.capitalized) \(user.name.last.capitalized)"
        emailLabel.text = "Email:   \(user.email)"
        addressLabel.text = "Street Address:    \(user.location.street.capitalized)"
        cityStateLabel.text = "City,State: \(user.location.city.capitalized), \(user.location.state.capitalized)"
        phoneLabel.text = "Cell:    \(user.cell)"
        dobLabel.text = "DOB:   \(user.dob.date)"
    }
}
