//
//  WelcomeViewController.swift
//  petProject
//
//  Created by Александр Полочанин on 31.03.23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var greetingLabelValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color1 = UIColor(red: 50 / 255, green: 83 / 255, blue: 149 / 255, alpha: 1).cgColor
        let color2 = UIColor(red: 63 / 255, green: 143 / 255, blue: 154 / 255, alpha: 1).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [ color1, color2 ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        greetingLabel.text = "Welcome, \(greetingLabelValue ?? "")!"
    }
    

   

}
