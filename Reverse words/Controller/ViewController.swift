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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reversTextButton(_ sender: UIButton) {
        if reverseButton.titleLabel?.text == "Reverse" {
            guard let inputText = inputTextField.text else { return }
            let reversedWrods = inputText.reversed()
            outputLabel.textColor = .blue
            outputLabel.text = String(reversedWrods)
            reverseButton.setTitle("Clear", for: .normal)
        } else {
            outputLabel.text = ""
            inputTextField.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
        }
    }
}
