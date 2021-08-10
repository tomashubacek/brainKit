//
//  FunctionsTest.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import XCTest
import BrainKit

final class FunctionsTest: XCTestCase {
	func test_Not() {
		XCTAssertTrue(not(false))
		XCTAssertFalse(not(true))
	}
}
