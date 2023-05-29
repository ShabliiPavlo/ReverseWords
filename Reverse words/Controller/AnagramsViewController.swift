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
    
    @IBAction func editingChangeTextReverse(_ sender: Any) {
        updateResultLabel()
    }
    
    @IBAction func editingChangeTextIgnor(_ sender: Any) {
        updateResultLabel()
    }
}

extension AnagramsViewController {
    func updateResultLabel() {
        guard let currentTextReverse = anagramsTextToReverse.text else {
            return
        }
        guard let currentTextIgnor = anagramsTextToIgnor.text else {
            return
        }
        let characterSetOfIgnor = CharacterSet(charactersIn: currentTextIgnor)
        let reversedText: String
        if switcherMods.selectedSegmentIndex == 0 {
            reversedText = anagramsModel.reverseTextOnly(currentTextReverse)
        } else {
            if anagramsTextToIgnor.text == "" {
                reversedText = anagramsModel.reverseText(currentTextReverse)
            } else {
                reversedText = currentTextReverse.reversedTextIgnor(ignoringCharactersIn: characterSetOfIgnor)
            }
            
        }
        resultTextLable.text = reversedText
    }
}


