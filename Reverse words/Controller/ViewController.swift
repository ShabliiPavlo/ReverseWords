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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reversTextButton(_ sender: UIButton) {
        guard let inputText = inputTextField.text else { return }
        let reversedText = reverseModel.reverseText(inputText)
        outputLabel.text = reversedText
        outputLabel.textColor = .blue
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
