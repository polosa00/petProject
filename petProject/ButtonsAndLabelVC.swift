//
//  ButtonsAndLabelVC.swift
//  petProject
//
//  Created by Александр Полочанин on 27.03.23.
//

import UIKit

class ButtonsAndLabelVC: UIViewController {

    
    @IBOutlet var mainLabel: UILabel!
    
    
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var actionButtons: [UIButton]!
    
    var counterOfClickers = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.isHidden = true
        clearButton.isHidden = true
        actionButton.isHidden = true
        
      
    }
    @IBAction func tappedButtons(_ sender: UIButton) {
        mainLabel.isHidden = false
        clearButton.isHidden = false
        
        print(counterOfClickers)
        if counterOfClickers >= 5 {
            actionButton.isHidden = false
        }
        
        switch sender.tag {
        case 0:
            mainLabel.text = "Hello, World!"
            counterOfClickers += 1
        case 1:
            mainLabel.text = "Hi, there😀"
            counterOfClickers += 1
        case 2:
            mainLabel.text = "Count of clicker is \(counterOfClickers)"
        default:
            mainLabel.isHidden = true
            clearButton.isHidden = true
            actionButton.isHidden = true
            counterOfClickers = 0
        }
    }
}
