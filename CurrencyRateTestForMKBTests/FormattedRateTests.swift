//
//  RateTests.swift
//  CurrencyRateTestForMKBTests
//
//  Created by Vitaly Prosvetov on 24.05.2021.
//

import XCTest
@testable import CurrencyRateTestForMKB

class FormattedRateTests: XCTestCase {
    var sut: FormattedRate!
    
    override func setUpWithError() throws {
        sut = FormattedRate()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - formatPrice
    
    func testFormatInputPriceToRublePrice() throws {
        XCTAssertEqual(sut.formatPrice(input: "", currency: .rur), "₽0.00")
        XCTAssertEqual(sut.formatPrice(input: "45.23543", currency: .rur), "₽45.23")
        XCTAssertEqual(sut.formatPrice(input: "0.094", currency: .rur), "₽0.09")
        XCTAssertEqual(sut.formatPrice(input: "195489.1", currency: .rur), "₽195 489.10")
    }
    
    func testFormatInputPriceToUSD() throws {
        XCTAssertEqual(sut.formatPrice(input: "", currency: .usd), "$0.00")
        XCTAssertEqual(sut.formatPrice(input: "dfww", currency: .usd), "$0.00")
        XCTAssertEqual(sut.formatPrice(input: "23.8490", currency: .usd), "$23.84")
        XCTAssertEqual(sut.formatPrice(input: "0.95", currency: .usd), "$0.95")
    }
    
    func testFormatInputPriceToEuro() throws {
        XCTAssertEqual(sut.formatPrice(input: "", currency: .eur), "€0.00")
        XCTAssertEqual(sut.formatPrice(input: "000", currency: .eur), "€0.00")
        XCTAssertEqual(sut.formatPrice(input: "123.01", currency: .eur), "€123.01")
        XCTAssertEqual(sut.formatPrice(input: "3.9235", currency: .eur), "€3.92")
    }
    
    func testFormatInputPriceToPound() throws {
        XCTAssertEqual(sut.formatPrice(input: "", currency: .gbp), "£0.00")
        XCTAssertEqual(sut.formatPrice(input: "00.45", currency: .gbp), "£0.45")
        XCTAssertEqual(sut.formatPrice(input: "0.01", currency: .gbp), "£0.01")
        XCTAssertEqual(sut.formatPrice(input: "936.9235", currency: .gbp), "£936.92")
    }
    
    // MARK: - getCountryCode
    
    func testRURCodeIsRUCountry() throws {
        XCTAssertEqual(sut.getCountryCode(from: "RUR"), "RU")
    }
}
