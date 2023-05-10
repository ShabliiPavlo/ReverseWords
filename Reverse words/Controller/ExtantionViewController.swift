//
//  ExtantionViewController.swift
//  Reverse words
//
//  Created by Pavel Shabliy on 11.05.2023.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = inputTextField.text
        if text?.isEmpty != nil {
           reverseButton.isEnabled = true
        } else {
           reverseButton.isEnabled = false
        }
    }
}
