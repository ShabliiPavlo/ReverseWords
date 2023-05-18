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
    
    override func setUpWithError() throws {
        reverseModel = ReverseModel()
    }
    
    override func tearDownWithError() throws {
        reverseModel = nil
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
