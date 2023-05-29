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
        var currentTextIgnor = ""
        
        for nonLetter in text {
            if !nonLetter.isLetter && !nonLetter.isWhitespace {
                currentTextIgnor.append(nonLetter)
            }
        }
        for character in text {
            if !character.isWhitespace {
                currentWord.append(character)
            } else {
                if !currentWord.isEmpty {
                    let characterSetOfIgnor = CharacterSet(charactersIn: currentTextIgnor)
                    let reversedWord = String(currentWord.reversedTextIgnor(ignoringCharactersIn: characterSetOfIgnor))
                    reversedText.append(reversedWord)
                    
                    currentWord = ""
                    
                }
                reversedText.append(character)
            }
        }
        
        if !currentWord.isEmpty {
            let characterSetOfIgnor = CharacterSet(charactersIn: currentTextIgnor)
            let reversedWord = String(currentWord.reversedTextIgnor(ignoringCharactersIn: characterSetOfIgnor))
            reversedText.append(reversedWord)
        }
        return reversedText
    }
    
    func reverseText(_ text: String) -> String {
        let separatedWords = text.components(separatedBy: " ")
        let reversedWords = separatedWords.map { String($0.reversed()) }
        let reversedText = reversedWords.joined(separator: " ")
        return reversedText
    }
    
}

extension String {
    func reversedTextIgnor(ignoringCharactersIn characterSet: CharacterSet) -> String {
        let separatedWords = components(separatedBy: " ")
        let reversedWords = separatedWords.map { $0.reversed(omittingCharactersIn: characterSet) }
        let reversedText = reversedWords.joined(separator: " ")
        return reversedText
    }
    
    func reversed(omittingCharactersIn characterSet: CharacterSet) -> String {
        var reversed = reversed()
            .filter { String($0).rangeOfCharacter(from: characterSet) == nil }
        let excluded = enumerated()
            .filter { String($0.element).rangeOfCharacter(from: characterSet) != nil }
        for (i, char) in excluded {
            reversed.insert(char, at: reversed.index(reversed.startIndex, offsetBy: i))
        }
        return String(reversed)
    }
}
