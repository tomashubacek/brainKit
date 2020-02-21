//
//  DoubleExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 21. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import XCTest
import BrainKit

final class DoubleExtensionsTests: XCTestCase {
	func testRationalsDefaulPrecision() {
		// given
		let data: [Double: Rational] = [
			0.333333: (1, 3),
			0.25: (1, 4),
			0.1764705882: (3, 17),
			2: (2, 1),
			1.666666: (5, 3),
		]

		for (input, expectation) in data {
			// when
			let result = input.rationalApproximation()

			// then
			XCTAssertEqual(result.num, expectation.num)
			XCTAssertEqual(result.den, expectation.den)
		}
	}

	func testRationalsLowPrecision() {
		// given
		let data: [Double: Rational] = [
			0.33: (1, 3),
			0.25: (1, 4),
			0.17: (1, 6),
			2: (2, 1),
			1.66: (5, 3),
		]
		for (input, expectation) in data {
			// when
			let result = input.rationalApproximation(withPrecision: 0.01)

			// then
			XCTAssertEqual(result.num, expectation.num)
			XCTAssertEqual(result.den, expectation.den)
		}
	}
}
