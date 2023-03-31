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
    
    @IBOutlet var redChanelTF: UITextField!
    @IBOutlet var grenChanelTF: UITextField!
    @IBOutlet var blueChanelTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        
        valueRedChanel.text = String(format: "%.2f", redSlider.value)
        valueGreenChanel.text = String(format: "%.2f", greenSlider.value)
        valueBlueChanel.text = String(format: "%.2f", blueSlider.value)
        
        setColor()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func tappedRandomButton() {
        redSlider.setValue(Float.random(in: 0...255), animated: true)
        greenSlider.setValue(Float.random(in: 0...255), animated: true)
        blueSlider.setValue(Float.random(in: 0...255), animated: true)
        
        valueRedChanel.text = String(format: "%.2f", redSlider.value)
        valueGreenChanel.text = String(format: "%.2f", greenSlider.value)
        valueBlueChanel.text = String(format: "%.2f", blueSlider.value)
        
        setColor()
    }
    
    @IBAction func tappedRedButton() {
        guard
            let inputText = redChanelTF.text,
                !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Enter value from 0 to 255")
            return
        }
        guard
            let inputValue = redChanelTF.text,
            let floatValue = Float(inputValue) else {
            return
        }
        
        if floatValue > 255 {
            showAlert(withTitle: "Wrong Value", andMessage: "Enter value from 0 to 255")
        } else {
            redSlider.setValue(floatValue, animated: true)
            valueRedChanel.text = String(floatValue)
        }
       
        setChanelValuePatterns(inputText: inputText)
        setColor()
        redChanelTF.text = nil
    }
    
    
    @IBAction func tappedGreenButton() {
        guard
            let inputText = grenChanelTF.text,
            !inputText.isEmpty else {
            return
        }
        guard
            let inputValue = grenChanelTF.text,
            let floatValue = Float(inputValue) else {
            return
        }
        
        if floatValue > 255 {
            showAlert(withTitle: "Wrong Value", andMessage: "Enter value from 0 to 255")
        } else {
            greenSlider.setValue(floatValue, animated: true)
            valueGreenChanel.text = String(floatValue)
        }
        setChanelValuePatterns(inputText: inputText)
        setColor()
        grenChanelTF.text = nil
    }
    
    @IBAction func tappedBlueButton() {
        guard
            let inputText = blueChanelTF.text,
            !inputText.isEmpty else {
            return
        }
        guard
            let inputValue = blueChanelTF.text,
            let floatValue = Float(inputValue) else {
            return
        }
        if floatValue > 255 {
            showAlert(withTitle: "Wrong Value", andMessage: "Enter value from 0 to 255")
        } else {
            blueSlider.setValue(floatValue, animated: true)
            valueBlueChanel.text = String(floatValue)
        }
        setChanelValuePatterns(inputText: inputText)
        setColor()
        blueChanelTF.text = nil
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
            red: CGFloat(redSlider.value) / 255,
            green: CGFloat(greenSlider.value) / 255,
            blue: CGFloat(blueSlider.value) / 255,
            alpha: 1
        )
    }
    
    private func showAlert(withTitle title: String, andMessage message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setChanelValuePatterns(inputText: String) {
        let chanelValuePattern = "^[0-9]{0,3}$"
        let isChanelValuePattern = NSPredicate(format: "SELF MATCHES %@", chanelValuePattern)
            .evaluate(with: inputText)
        
        if !isChanelValuePattern {
            showAlert(
                withTitle: "WRONG FORMAT",
                andMessage: "Input value from 0 to 255"
            )
        }
    }
}
