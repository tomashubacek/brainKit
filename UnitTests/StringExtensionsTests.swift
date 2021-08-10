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
	func test_Normalized() {
		XCTAssertEqual("abc".normalized(), "abc")
		XCTAssertEqual("Abc".normalized(), "abc")
		XCTAssertEqual("ábč".normalized(), "abc")
		XCTAssertEqual("ÄbČ".normalized(), "abc")
	}

	func test_NonBreakingSpacesRemoval() {
		let input = "x\u{00A0}y z"
		let output = input.removingNonBreakingSpaces()
		XCTAssertEqual(output, "x y z")
	}

	func test_NonBreakingSpacesRemoval_Mutating() {
		var input = "x\u{00A0}y z"
		input.removeNonBreakingSpaces()
		XCTAssertEqual(input, "x y z")
	}

	func test_CapitalizingFirstLetter() {
		let input = "hello"
		let output = input.capitalizingFirstLetter()
		XCTAssertEqual(output, "Hello")
	}

	func test_CapitalizingFirstLetter_Mutating() {
		var input = "čau"
		input.capitalizeFirstLetter()
		XCTAssertEqual(input, "Čau")
	}

	func test_TrimmingWhitespacesAndNewlines() {
		let input = "\n a b c \t"
		let output = input.trimmingWhitespacesAndNewlines()
		XCTAssertEqual(output, "a b c")
	}

	func test_TrimmingWhitespacesAndNewlines_Mutating() {
		var input = "\n a b c \t"
		input.trimWhitespacesAndNewlines()
		XCTAssertEqual(input, "a b c")
	}

	func test_Base64Encode() {
		let input = "hello"
		let output = input.toBase64()
		XCTAssertEqual(output, "aGVsbG8=")
	}

	func test_Base64Decode_Success() {
		let input = "aGVsbG8="
		let output = input.fromBase64()
		XCTAssertEqual(output, "hello")
	}

	func test_Base64Decode_Failure() {
		let input = "???"
		let output = input.fromBase64()
		XCTAssertNil(output)
	}

	func test_ReversedDomain() {
		let inputs = ["", "ab", "ab.ba", "a..b", "a.b.c"]
		let expectations = ["", "ab", "ba.ab", "b..a", "c.b.a"]
		for i in 0 ..< inputs.count {
			let input = inputs[i]
			let expectation = expectations[i]
			let output = input.reversedDomain()
			XCTAssertEqual(output, expectation)
		}
	}

	func test_Email() {
		// lists based on https://gist.github.com/cjaoude/fd9910626629b53c4d25
		XCTAssertTrue("email@example.com".isValidEmail)
		XCTAssertTrue("firstname.lastname@example.com".isValidEmail)
		XCTAssertTrue("email@subdomain.example.com".isValidEmail)
		XCTAssertTrue("firstname+lastname@example.com".isValidEmail)
		XCTAssertTrue("email@123.123.123.123".isValidEmail)
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
		XCTAssertFalse("mailto:email@example.com".isValidEmail)
		XCTAssertFalse("email@-example.com".isValidEmail)
		XCTAssertFalse(".email@example.com".isValidEmail)
		XCTAssertFalse("email.@example.com".isValidEmail)
		XCTAssertFalse("email..email@example.com".isValidEmail)
		XCTAssertFalse("email@example..com".isValidEmail)
		XCTAssertFalse("Abc..123@example.com".isValidEmail)
		XCTAssertFalse("”(),:;<>[\\]@example.com".isValidEmail)
		XCTAssertFalse("just”not”right@example.com".isValidEmail)

		// These are not working with ^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$ regexp:
//		XCTAssertTrue("email@[123.123.123.123]".isValidEmail)
//		XCTAssertTrue("\"email\"@example.com".isValidEmail)
//		XCTAssertFalse("あいうえお@example.com".isValidEmail)
//		XCTAssertFalse("email@111.222.333.44444".isValidEmail)
	}
}
