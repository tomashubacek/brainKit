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
		let x = num.map(from: 0...5, to: 1...10)
		XCTAssertEqual(x, 1)
	}

	func test_EndRange() {
		let num = 5.0
		let x = num.map(from: 0...5, to: 1...10)
		XCTAssertEqual(x, 10)
	}

	func test_OutOfRange() {
		let num = 5.0
		let x = num.map(from: 6...10, to: 60...100)
		XCTAssertEqual(x, 50)
	}

	func test_InRange() {
		let num = 2.0
		let x = num.map(from: 1...3, to: 10...12)
		XCTAssertEqual(x, 11)
	}
}
