//
//  ArrayExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 25. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

import BrainKit
import XCTest

final class ArrayExtensionsTests: XCTestCase {

	func test_Move_WrongParams() {
		var input = [1, 2, 3]

		// from too low
		input.move(from: -1, to: 0)
		XCTAssertEqual(input, [1, 2, 3])

		// from too high
		input.move(from: 10, to: 0)
		XCTAssertEqual(input, [1, 2, 3])

		// to too low
		input.move(from: 0, to: -1)
		XCTAssertEqual(input, [1, 2, 3])

		// to too high
		input.move(from: 0, to: 10)
		XCTAssertEqual(input, [1, 2, 3])
	}

	func test_Move_CorrectParams() {
		// same indexes
		var input = [1, 2, 3]
		input.move(from: 0, to: 0)
		XCTAssertEqual(input, [1, 2, 3])

		// correct move
		input.move(from: 0, to: 1)
		XCTAssertEqual(input, [2, 1, 3])
	}
}
