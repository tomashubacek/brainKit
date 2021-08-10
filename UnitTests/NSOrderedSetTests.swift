//
//  NSOrderedSetTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 28. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import XCTest

final class NSOrderedSetTestsTests: XCTestCase {
	func test_IsEmpty() {
		let empty = NSOrderedSet()
		XCTAssertTrue(empty.isEmpty)

		let nonEmpty = NSOrderedSet(array: [1])
		XCTAssertFalse(nonEmpty.isEmpty)
	}
}
