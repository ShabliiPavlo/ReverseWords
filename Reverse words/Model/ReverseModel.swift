//
//  ReverseModel.swift
//  Reverse words
//
//  Created by Pavel Shabliy on 11.05.2023.
//

import Foundation

class ReverseModel {
    func reverseText(_ text: String) -> String {
        let separatedWords = text.components(separatedBy: " ")
        let reversedWords = separatedWords.map { String($0.reversed()) }
        let reversedText = reversedWords.joined(separator: " ")
        return reversedText
    }
}
