//
//  LoginViewController.swift
//  petProject
//
//  Created by Александр Полочанин on 31.03.23.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            userNameTF.text == "Alex",
            userPasswordTF.text == "1111" else {
            showAlert(forTitle: "Incorrect login or password", andMessage: "Try again")
            return
        }
        
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard let text = userNameTF.text else { return }
        
        welcomeVC.greetingLabelValue = text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        userPasswordTF.text = nil
    }
    
    
    @IBAction func tappedForgotNameButton() {
        showAlert(forTitle: "Oops", andMessage: "User name is Alex😎")
    }
    
    @IBAction func tappedForgotPasswordButton() {
        showAlert(forTitle: "Oops", andMessage: "User password is 1111⚠︎")
    }
    
    
}

extension LoginViewController {
    private func showAlert(forTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = nil
            self.userPasswordTF.text = nil
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
