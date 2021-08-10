//
//  APIDateFormatterTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 30. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import XCTest
import BrainKit

final class APIDateFormatterTests: XCTestCase {
	func test_APIDateFormatter_CorrectInput() {
		let input = "2020-04-30T10:20:30.456Z"
		let formatter = APIDateFormatter()
		let result = formatter.date(from: input)

		guard let date = result else {
			XCTFail("Date expected not to be nil.")
			return
		}

		var calendar = Calendar.current
		calendar.timeZone = formatter.timeZone
		let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: date)

		XCTAssertEqual(components.year, 2020)
		XCTAssertEqual(components.month, 4)
		XCTAssertEqual(components.day, 30)
		XCTAssertEqual(components.hour, 10)
		XCTAssertEqual(components.minute, 20)
		XCTAssertEqual(components.second, 30)

		guard let nanoseconds = components.nanosecond else {
			XCTFail("Nanoseconds not parsed.")
			return
		}
		XCTAssertEqual(nanoseconds / 1_000_000, 456)
	}

	func test_APIDateFormatter_WrongInput() {
		let input = "2020-04-30T10:20:30.456" // missing Z at the end
		let formatter = APIDateFormatter()
		let result = formatter.date(from: input)
		XCTAssertNil(result)
	}
}
