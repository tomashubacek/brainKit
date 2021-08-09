//
//  OrderableSetTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 16. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import XCTest
import BrainKit

final class OrderableSetTests: TestCoreDataTestCase {
	private func makeOrderableSet(from: Int, to: Int) -> Set<TestingEntity> {
		var set: Set<TestingEntity> = []
		for i in from ... to {
			let e = TestingEntity(context: self.coreDataContainer.mainContext)
			e.id = Int64(i)
			e.ord = Int32(i)
			set.insert(e)
		}
		return set
	}

	func test_Ordering_Ascending() {
		let from = 1
		let to = 3
		let set = self.makeOrderableSet(from: from, to: to)
		let result = set.inOrder(ascending: true)
		XCTAssertEqual(result.first?.ord, Int32(from))
		XCTAssertEqual(result.last?.ord, Int32(to))
	}

	func test_Ordering_Descending() {
		let from = 1
		let to = 3
		let set = self.makeOrderableSet(from: from, to: to)
		let result = set.inOrder(ascending: false)
		XCTAssertEqual(result.first?.ord, Int32(to))
		XCTAssertEqual(result.last?.ord, Int32(from))
	}
}
