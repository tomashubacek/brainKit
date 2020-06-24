//
//  UIViewExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 20. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import XCTest
import BrainKit

final class UIViewExtensionsTests: XCTestCase {

	func test_ForAutolayout() {
		let auto = UIImageView().forAutolayout()
		XCTAssertFalse(auto.translatesAutoresizingMaskIntoConstraints)
	}
}
