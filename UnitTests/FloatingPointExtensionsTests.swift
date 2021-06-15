//
//  FloatingPointExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 25. 06. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import BrainKit
import XCTest

final class FloatingPointExtensionsTests: XCTestCase {

	func test_StartRange() {
		let num = 0.0
		let x = num.map(from: (0,5), to: (1,10))
		XCTAssertEqual(x, 1)
	}

	func test_EndRange() {
		let num = 5.0
		let x = num.map(from: (0,5), to: (1,10))
		XCTAssertEqual(x, 10)
	}

	func test_OutOfRange() {
		let num = 5.0
		let x = num.map(from: (6,10), to: (60,100))
		XCTAssertEqual(x, 50)
	}

	func test_OutOfRangeLimitBelow() {
		let num = 5.0
		let x = num.map(from: (6,10), to: (60,100), limitToBounds: true)
		XCTAssertEqual(x, 60)
	}

	func test_OutOfRangeLimitAbove() {
		let num = 11.0
		let x = num.map(from: (6,10), to: (60,100), limitToBounds: true)
		XCTAssertEqual(x, 100)
	}

	func test_InRange() {
		let num = 2.0
		let x = num.map(from: (1,3), to: (10,12))
		XCTAssertEqual(x, 11)
	}

	func test_ReversedInRange() {
		let num = 2.0
		let x = num.map(from: (1,4), to: (4,1))
		XCTAssertEqual(x, 3)
	}

	func test_ReversedOutOfRange() {
		let num = -1.0
		let x = num.map(from: (1,4), to: (4,1))
		XCTAssertEqual(x, 6)
	}

	func test_ReversedOutOfRangeLimitBelow() {
		let num = 5.0
		let x = num.map(from: (1,4), to: (4,1), limitToBounds: true)
		XCTAssertEqual(x, 1)
	}

	func test_ReversedOutOfRangeLimitAbove() {
		let num = -1.0
		let x = num.map(from: (1,4), to: (4,1), limitToBounds: true)
		XCTAssertEqual(x, 4)
	}

	func test_EmptyRange() {
		let num = 1.0
		let x = num.map(from: (1,1), to: (1,2))
		XCTAssertTrue(x.isNaN)
	}
}
