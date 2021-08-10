//
//  URLExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import BrainKit
import XCTest

final class URLExtensionsTests: XCTestCase {
	func test_StaticInit_Success() {
		let url = URL(staticString: "https://exmaple.org")
		XCTAssertEqual(url.absoluteString, "https://exmaple.org")
	}

	func test_StaticInit_Failure() {
		self.expectFatalError(expectedMessage: "Invalid static URL string: <>") {
			_ = URL(staticString: "<>")
		}
	}

	func test_AppedingParams() {
		let input = URL(string: "https://example.org")!
		var output = input.appendingParam(name: "foo", value: "bar")
		XCTAssertEqual(output.absoluteString, "https://example.org?foo=bar")

		output = output.appendingParam(name: "x", value: nil)
		XCTAssertEqual(output.absoluteString, "https://example.org?foo=bar&x")
	}
}
