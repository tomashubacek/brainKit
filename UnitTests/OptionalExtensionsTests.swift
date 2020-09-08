//
//  OptionalExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 29. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import XCTest

final class OptionalExtensionsTests: XCTestCase {
	func test_ConditionalAssignment() {
		var a: String? = nil
		a ||= "assignment"
		XCTAssertEqual(a, "assignment")

		var b: String? = "initial value"
		b ||= "assignment"
		XCTAssertEqual(b, "initial value")
	}

	func test_isNilOrEmpty() {
		let nilStr: String? = nil
		XCTAssertTrue(nilStr.isNilOrEmpty)

		let emptyStr: String? = ""
		XCTAssertTrue(emptyStr.isNilOrEmpty)

		let str: String? = "str"
		XCTAssertFalse(str.isNilOrEmpty)
	}
}
