//
//  extensionLogInController.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import UIKit

extension LogInViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if UserNameTextField.text == LoginDetails.UserName.rawValue && PasswordTextField.text == LoginDetails.Password.rawValue{
            let vc = storyboard?.instantiateViewController(identifier: ViewController.SecondScreen.rawValue) as! PriceViewController
            present(vc, animated: true, completion: nil)
            return true
        }else{
            return false
        }
    }
}
