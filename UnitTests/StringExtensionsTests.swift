//
//  StringExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import BrainKit
import XCTest

final class StringExtensionsTests: XCTestCase {

	func testNonBreakingSpacesRemoval() {
		let input = "x\u{00A0}y z"
		let output = input.removingNonBreakingSpaces()
		XCTAssertEqual(output, "x y z")
	}

	func testNonBreakingSpacesRemovalMutating() {
		var input = "x\u{00A0}y z"
		input.removeNonBreakingSpaces()
		XCTAssertEqual(input, "x y z")
	}

	func testBase64Encode() {
		let input = "hello"
		let output = input.toBase64()
		XCTAssertEqual(output, "aGVsbG8=")
	}

	func testBase64DecodeSuccess() {
		let input = "aGVsbG8="
		let output = input.fromBase64()
		XCTAssertEqual(output, "hello")
	}

	func testBase64DecodeFailure() {
		let input = "???"
		let output = input.fromBase64()
		XCTAssertNil(output)
	}
}
