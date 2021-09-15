//
//  extensionLogInController.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import UIKit

extension LogInController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if userNameText.text == LoginDetails.UserName.rawValue && passwordText.text == LoginDetails.Password.rawValue{
            let vc = storyboard?.instantiateViewController(identifier: ViewController.SecondScreen.rawValue) as! priceControllerViewController
            present(vc, animated: true, completion: nil)
            return true
        }else{
            return false
        }
    }
    
}
