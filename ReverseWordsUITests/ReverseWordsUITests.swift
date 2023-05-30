
//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Pavel Shabliy on 16.05.2023.
//

import XCTest

final class ReverseWordsUITests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let inputTextField = app.textFields["Text to reverse"]
        let reverseButton = app.buttons["Reverse"]
        let outputLabel = app.staticTexts["OutputLabel"]
        let testString = "321"
        
        inputTextField.tap()
        inputTextField.typeText("123")
        app.buttons["return"].tap()
        reverseButton.tap()
        
        XCTAssertEqual(outputLabel.label, testString)
    }
    
    func testAnagrams() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Anagrams mod"].tap()
        
        let anagramsTextToReverseTextField = app/*@START_MENU_TOKEN@*/.textFields["anagramsTextToReverse"]/*[[".textFields[\"Text to reverse\"]",".textFields[\"anagramsTextToReverse\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let segmentedControllerCustom = app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls[\"switcherTextType\"].buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let resultLable = app.staticTexts["resultTextLable"]
        let testStringDefault = "xoF 24"
        let testStringCustom = "xoF 42"
        
        anagramsTextToReverseTextField.tap()
        anagramsTextToReverseTextField.typeText("Fox 24")
        XCTAssertEqual(resultLable.label, testStringDefault)
        
        segmentedControllerCustom.tap()
        XCTAssertEqual(resultLable.label, testStringCustom)
    }
}
