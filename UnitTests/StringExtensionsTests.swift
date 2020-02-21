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

	func testtrimmingWhitespacesAndNewlines() {
		let input = "\n a b c \t"
		let output = input.trimmingWhitespacesAndNewlines()
		XCTAssertEqual(output, "a b c")
	}

	func testtrimmingWhitespacesAndNewlinesMutating() {
		var input = "\n a b c \t"
		input.trimWhitespacesAndNewlines()
		XCTAssertEqual(input, "a b c")
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

	func testEmail() {
			// lists based on https://gist.github.com/cjaoude/fd9910626629b53c4d25
			XCTAssertTrue("email@example.com".isValidEmail)
			XCTAssertTrue("firstname.lastname@example.com".isValidEmail)
			XCTAssertTrue("email@subdomain.example.com".isValidEmail)
			XCTAssertTrue("firstname+lastname@example.com".isValidEmail)
			XCTAssertTrue("email@123.123.123.123".isValidEmail)
			XCTAssertTrue("email@[123.123.123.123]".isValidEmail)
			XCTAssertTrue("\"email\"@example.com".isValidEmail)
			XCTAssertTrue("1234567890@example.com".isValidEmail)
			XCTAssertTrue("email@example-one.com".isValidEmail)
			XCTAssertTrue("_______@example.com".isValidEmail)
			XCTAssertTrue("email@example.name".isValidEmail)
			XCTAssertTrue("email@example.museum".isValidEmail)
			XCTAssertTrue("email@example.co.jp".isValidEmail)
			XCTAssertTrue("firstname-lastname@example.com".isValidEmail)

			XCTAssertFalse("#@%^%#$@#$@#.com".isValidEmail)
			XCTAssertFalse("@example.com".isValidEmail)
			XCTAssertFalse("Joe Smith <email@example.com>".isValidEmail)
			XCTAssertFalse("email.example.com".isValidEmail)
			XCTAssertFalse("email@example@example.com".isValidEmail)
			XCTAssertFalse("this\\ is\"really\"not\\allowed@example.com".isValidEmail)
			XCTAssertFalse("email@example.com (Joe Smith)".isValidEmail)
			XCTAssertFalse("email@example".isValidEmail)

	// These are not working with current regexp:
	//		XCTAssertFalse(".email@example.com".isValidEmail)
	//		XCTAssertFalse("email.@example.com".isValidEmail)
	//		XCTAssertFalse("email..email@example.com".isValidEmail)
	//		XCTAssertFalse("あいうえお@example.com".isValidEmail)
	//		XCTAssertFalse("email@-example.com".isValidEmail)
	//		XCTAssertFalse("email@111.222.333.44444".isValidEmail)
	//		XCTAssertFalse("email@example..com".isValidEmail)
	//		XCTAssertFalse("Abc..123@example.com".isValidEmail)
	//		XCTAssertFalse("”(),:;<>[\\]@example.com".isValidEmail)
	//		XCTAssertFalse("just”not”right@example.com".isValidEmail)
		}
}
