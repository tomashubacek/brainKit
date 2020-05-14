//
//  CollectionExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 20. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import XCTest

final class CollectionExtensionsTests: XCTestCase {

	func test_SafeSubscript() {
		let data = [0, 1, 2]
		XCTAssertNotNil(data[safe: 1])
		XCTAssertNil(data[safe: 10])
	}

}
