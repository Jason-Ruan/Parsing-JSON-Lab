//
//  Color DetailViewController.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color: Color!
    
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var rgbValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        colorName.text = color.name.value
        hexValueLabel.text = "Hex: \(color.hex.value)"
        rgbValueLabel.text = "RBG: \(color.rgb.value.dropFirst(3))"
        
        let colorComponentValues = color.rgb.fraction
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(colorComponentValues.r), green: CGFloat(colorComponentValues.g), blue: CGFloat(colorComponentValues.b), alpha: 1)
        
        if colorComponentValues.r + colorComponentValues.g + colorComponentValues.b >= 0.5 {
            colorName.textColor = UIColor.white
            hexValueLabel.textColor = UIColor.white
            rgbValueLabel.textColor = UIColor.white
        }
    }

}
