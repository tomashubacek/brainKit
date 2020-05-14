//
//  SequenceExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 04. 03. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import BrainKit
import XCTest

final class SequenceExtensionsTests: XCTestCase {

	func test_Unique() {
		let input = [1,2,3,3,2,1,4]
		let output = input.unique()
		XCTAssertEqual([1,2,3,4], output)
	}
}
