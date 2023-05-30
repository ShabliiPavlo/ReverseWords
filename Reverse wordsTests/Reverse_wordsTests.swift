//
//  Reverse_wordsTests.swift
//  Reverse wordsTests
//
//  Created by Pavel Shabliy on 15.05.2023.
//

import XCTest
@testable import Reverse_words

final class Reverse_wordsTests: XCTestCase {
    
    var reverseModel: ReverseModel!
    var anagramsModel: AnagramsModel!
    
    override func setUpWithError() throws {
        reverseModel = ReverseModel()
        anagramsModel = AnagramsModel()
    }
    
    override func tearDownWithError() throws {
        reverseModel = nil
        anagramsModel = nil
        try super.tearDownWithError()
    }
    
    func testCorrectReverse() throws {
        // Test case 1
        let inputTest = "Test string"
        let expectedOutputTest = "tseT gnirts"
        let outputTest = reverseModel.reverseText(inputTest)
        XCTAssertEqual(outputTest, expectedOutputTest)
        
        // Test case 2
        let inputHello = "Hello!"
        let expectedOutputHello = "!olleH"
        let outputHello = reverseModel.reverseText(inputHello)
        XCTAssertEqual(expectedOutputHello, outputHello)
    }
    
    func testCorrectDefaultExclusion() {
        // Test case 1
        let inputTestFox = "Foxminded cool 24/7"
        let expectedOutputTestFox = "dednimxoF looc 24/7"
        let outputFox = anagramsModel.reverseTextOnly(inputTestFox)
        XCTAssertEqual(expectedOutputTestFox,outputFox)
        
        // Test case 2
        let inputTestRandomCharacter = "abcd efgh"
        let expectedOutputTestRandom = "dcba hgfe"
        let outputRandom = anagramsModel.reverseTextOnly(inputTestRandomCharacter)
        XCTAssertEqual(expectedOutputTestRandom, outputRandom)
        
        // Test case 3
        let inputTestPunctuationMark = "a1bcd efg!h"
        let expectedOutputTestMark = "d1cba hgf!e"
        let outputMark = anagramsModel.reverseTextOnly(inputTestPunctuationMark)
        XCTAssertEqual(expectedOutputTestMark, outputMark)
    }
    
    func testCorrectCustomExclusion() {
        let exclusion = "xl"
        let exclusionCharacterSet = CharacterSet(charactersIn: exclusion)
        
        //Test case 1
        let inputTestFox = "Foxminded cool 24/7"
        let expectedOutputTestFox = "dexdnimoF oocl 7/42"
        let outputFox = inputTestFox.reversedTextIgnor(ignoringCharactersIn: exclusionCharacterSet)
        XCTAssertEqual(expectedOutputTestFox,outputFox)
        
        //Test case 2
        let inputTestRandomCharacter = "abcd efgh"
        let expectedOutputTestRandom = "dcba hgfe"
        let outputRandom = inputTestRandomCharacter.reversedTextIgnor(ignoringCharactersIn: exclusionCharacterSet)
        XCTAssertEqual(expectedOutputTestRandom, outputRandom)
        
        //Test case 3
        let inputTestPunctuationMark = "a1bcd efglh"
        let expectedOutputTestMark = "dcb1a hgfle"
        let outputMark = inputTestPunctuationMark.reversedTextIgnor(ignoringCharactersIn: exclusionCharacterSet)
        XCTAssertEqual(expectedOutputTestMark, outputMark)
    }
    
    func testPerformanceExample() throws {
        let inputTestSpeed = "Speed"
        measure(
            metrics: [
                XCTClockMetric(),
                XCTCPUMetric(),
                XCTStorageMetric(),
                XCTMemoryMetric()
            ]
        ) {
            reverseModel.reverseText(inputTestSpeed)
        }
    }
    
}
