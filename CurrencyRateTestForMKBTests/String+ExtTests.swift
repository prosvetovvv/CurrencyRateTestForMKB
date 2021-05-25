//
//  String+ExtTests.swift
//  CurrencyRateTestForMKBTests
//
//  Created by Vitaly Prosvetov on 25.05.2021.
//

import XCTest
@testable import CurrencyRateTestForMKB


class String_ExtTests: XCTestCase {

    func testConvertStringToDouble() throws {
        XCTAssertEqual("34.234".convertToDouble(), 34.234)
        XCTAssertEqual("sdf".convertToDouble(), 0)
        XCTAssertEqual("00.0234".convertToDouble(), 0.0234)
        XCTAssertEqual("2,2".convertToDouble(), 2.0)
    }
}
