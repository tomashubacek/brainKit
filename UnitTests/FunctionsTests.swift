//
//  FunctionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 07. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import XCTest

final class FunctionsTests: XCTestCase {
	func test_not() {
		XCTAssertTrue(not(false))
		XCTAssertFalse(not(true))
	}
}
