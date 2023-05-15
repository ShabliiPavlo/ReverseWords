//
//  ViewController.swift
//  Reverse words
//
//  Created by Pavel Shabliy on 04.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    let reverseModel = ReverseModel()
    let bottomLine = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldAppearance()
    }
    
    func setupTextFieldAppearance() {
        bottomLine.frame = CGRect(x: 0, y: inputTextField.frame.height - -5, width: inputTextField.frame.width, height: 1)
        updateBottomLineColor(active: false)
        inputTextField.layer.addSublayer(bottomLine)
    }
    
    @IBAction func reversTextButton(_ sender: UIButton) {
        guard let inputText = inputTextField.text else { return }
        let reversedText = reverseModel.reverseText(inputText)
        outputLabel.text = reversedText
        reverseButton.isHidden = true
        clearButton.isHidden = false
    }
    
    @IBAction func clearTextButton(_ sender: UIButton) {
        inputTextField.text = ""
        outputLabel.text = ""
        reverseButton.isHidden = false
        clearButton.isHidden = true
        reverseButton.isEnabled = false
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = inputTextField.text
        if text?.isEmpty != nil {
            reverseButton.isEnabled = true
        } else {
            reverseButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateBottomLineColor(active: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateBottomLineColor(active: false)
    }
    
    func updateBottomLineColor(active: Bool) {
        bottomLine.backgroundColor = active ? UIColor.blue.cgColor : UIColor.black.cgColor
    }
}
