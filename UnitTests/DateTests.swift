//
//  DateTests.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 30. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import XCTest

final class DateTests: XCTestCase {
	private var calendar: Calendar!

	override func setUp() {
		super.setUp()
		self.calendar = Calendar.current
	}

	override func tearDown() {
		self.calendar = nil
		super.tearDown()
	}

	func test_DateString_CorrectInput() {
		let date = Date.from(dateString: "2019-02-03")!
		let components = self.calendar.dateComponents([.year, .month, .day], from: date)
		XCTAssertEqual(components.year, 2019)
		XCTAssertEqual(components.month, 2)
		XCTAssertEqual(components.day, 3)
	}

	func test_DateString_WrongInput() {
		let date = Date.from(dateString: "2019") // too short
		XCTAssertNil(date)
	}

	func test_ISODateString() {
		let input = "2019-02-03"
		let date = Date.from(dateString: input)!
		let output = date.isoDateString()
		XCTAssertEqual(input, output)
	}
}
