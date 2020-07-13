//
//  BoolExtensionTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 07. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import XCTest

final class BoolExtensionTests: XCTestCase {
	func test_Not() {
		XCTAssertTrue(false.not())
		XCTAssertFalse(true.not())
	}
}
