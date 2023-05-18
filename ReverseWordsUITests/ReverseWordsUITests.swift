
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
}
