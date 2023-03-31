//
//  UISegmentedControlVC.swift
//  petProject
//
//  Created by Александр Полочанин on 29.03.23.
//

import UIKit

class UISegmentedControlVC: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentTintColor = .brown
        
        
    }
}
