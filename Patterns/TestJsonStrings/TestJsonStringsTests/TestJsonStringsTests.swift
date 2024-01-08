//
//  TestJsonStringsTests.swift
//  TestJsonStringsTests
//
//  Created by sreekanth reddy iragam on 10/10/23.
//

import XCTest
@testable import TestJsonStrings

final class TestJsonStringsTests: XCTestCase {
    func testModel() throws {
        let value = MyData(name: "sree", age: 10, amount: 20.0)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        let stringVaalue = try! encoder.encode(value)
        let actualStr = String(data: stringVaalue, encoding: .utf8)
        let valueV = "{\"age\":10,\"amount\":20,\"name\":\"sree\"}"
        XCTAssertEqual(actualStr, valueV)
    }
}
