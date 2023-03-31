//
//  ColorizedViewController.swift
//  petProject
//
//  Created by Александр Полочанин on 31.03.23.
//

import UIKit

class ColorizedViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var valueRedChanel: UILabel!
    @IBOutlet var valueGreenChanel: UILabel!
    @IBOutlet var valueBlueChanel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        
        valueRedChanel.text = String(format: "%.2f", redSlider.value)
        valueGreenChanel.text = String(format: "%.2f", greenSlider.value)
        valueBlueChanel.text = String(format: "%.2f", blueSlider.value)
        
        setColor()
    }

    
    @IBAction func changedSliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            valueRedChanel.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            valueGreenChanel.text = String(format: "%.2f", greenSlider.value)
        default:
            valueBlueChanel.text = String(format: "%.2f", blueSlider.value)
        }
    }
}

extension ColorizedViewController {
    private func setColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
