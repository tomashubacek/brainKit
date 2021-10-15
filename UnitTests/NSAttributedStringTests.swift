//
//  NSAttributedStringTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 15.10.2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import XCTest

final class NSAttributedStringTests: XCTestCase {
	func test_trimEffective() {
		let str = "_ č"
		let padded = "\n \(str)\n "
		let attributed = NSAttributedString(string: padded)
		let trimmed = attributed.trimmingCharacters(in: .whitespacesAndNewlines)
		XCTAssertEqual(trimmed.string, str)
	}

	func test_trimUneffective() {
		let str = "a b"
		let attributed = NSAttributedString(string: str)
		let trimmed = attributed.trimmingCharacters(in: .whitespacesAndNewlines)
		XCTAssertEqual(trimmed.string, str)
	}
}
