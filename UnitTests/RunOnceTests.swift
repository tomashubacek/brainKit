//
//  RunOnceTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import XCTest
import BrainKit

final class RunOnceTests: XCTestCase {
	func test_RunOnce() {
		let once = RunOnce()
		var counter = 1
		let onceRunner = { once.runOnce { counter += 1 } }
		onceRunner()
		onceRunner()
		XCTAssertEqual(counter, 2)
	}
}
