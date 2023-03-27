//
//  TrafficLightsVC.swift
//  petProject
//
//  Created by Александр Полочанин on 27.03.23.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class TrafficLightsVC: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    private var currentLight = CurrentLight.red
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.height / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.height / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.height / 2
        
    }
    

    @IBAction func tappedButton(_ sender: UIButton) {
        if sender.currentTitle == "START" {
            sender.setTitle("NEXT", for: .normal)
        }
        
        view.backgroundColor = .black
        sender.backgroundColor = .blue
        
        switch currentLight {
        case .red:
            redLightView.alpha = lightIsOn
            greenLightView.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowLightView.alpha = lightIsOn
            redLightView.alpha = lightIsOff
            currentLight = .green
        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .red
        }
        
        
    }
    
    
}
