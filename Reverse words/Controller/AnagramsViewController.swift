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
    @IBOutlet weak var resultTextLable: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    @IBOutlet weak var anagramsTextToIgnor: UITextField!
    
    @IBOutlet weak var switcherMods: UISegmentedControl!
    
    let anagramsModel = AnagramsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchReverseType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            anagramsTextToIgnor.isHidden = true
            resultDescription.isHidden = false
            updateResultLabel()
        } else {
            anagramsTextToIgnor.isHidden = false
            resultDescription.isHidden = true
            updateResultLabel()
        }
    }
}

extension AnagramsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentTextReverse = anagramsTextToReverse.text,
              let updatedTextReverse = (currentTextReverse as NSString?)?.replacingCharacters(in: range, with: string) else {
            return true
        }
        
        let reversedText: String
        if switcherMods.selectedSegmentIndex == 0 {
            reversedText = anagramsModel.reverseTextOnly(updatedTextReverse)
        } else {
            reversedText = anagramsModel.reverseText(updatedTextReverse)
        }
        
        resultTextLable.text = reversedText
        anagramsTextToReverse.text = updatedTextReverse
        
        return false
    }
    
    func updateResultLabel() {
        guard let currentTextReverse = anagramsTextToReverse.text else {
            return
        }
        
        let reversedText: String
        if switcherMods.selectedSegmentIndex == 0 {
            reversedText = anagramsModel.reverseTextOnly(currentTextReverse)
        } else {
            reversedText = anagramsModel.reverseText(currentTextReverse)
        }
        
        resultTextLable.text = reversedText
    }
}


