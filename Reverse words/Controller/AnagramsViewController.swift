//
//  AnagremsViewController.swift
//  Reverse words
//
//  Created by Pavel Shabliy on 19.05.2023.
//

import UIKit

class AnagramsViewController: UIViewController {
    
    @IBOutlet weak var switcherTextType: UISegmentedControl!
    @IBOutlet weak var anagramsTextToReverse: UITextField!
    @IBOutlet weak var resulttextLable: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    @IBOutlet weak var anagramsTextToIgnor: UITextField!
    
    let anagramsModel = AnagramsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switcherReversType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            anagramsTextToIgnor.isHidden = true
            resultDescription.isHidden = false
        } else {
            anagramsTextToIgnor.isHidden = false
            resultDescription.isHidden = true
        }
    }
    
}

extension AnagramsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let inputText = anagramsTextToReverse.text else { return true }
        let reversedText = anagramsModel.reverseTextOnly(inputText)
        
        if let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) {
            
            resulttextLable.text = reversedText
            
            guard !text.isEmpty else {
                resulttextLable.text = "" 
                return true
            }
        }
        return true
    }
}


