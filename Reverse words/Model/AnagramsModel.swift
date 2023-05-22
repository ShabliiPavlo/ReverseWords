//
//  AnagramsModel.swift
//  Reverse words
//
//  Created by Pavel Shabliy on 19.05.2023.
//

import Foundation

class AnagramsModel {
    func reverseTextOnly(_ text: String) -> String {
        var reversedText = ""
        var currentWord = ""
        
        for character in text {
            if character.isLetter {
                currentWord.append(character)
            } else {
                if !currentWord.isEmpty {
                    let reversedWord = String(currentWord.reversed())
                    reversedText.append(reversedWord)
                    currentWord = ""
                }
                reversedText.append(character)
            }
        }
        
        if !currentWord.isEmpty {
            let reversedWord = String(currentWord.reversed())
            reversedText.append(reversedWord)
        }
        return reversedText
    }
}
