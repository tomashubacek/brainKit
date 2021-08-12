//
//  MemCacheTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 06. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

import XCTest
import BrainKit

final class MemCacheTests: XCTestCase {
	var cache: MemCache<Int, IndexPath>!

	override func setUp() {
		super.setUp()
		self.cache = MemCache()
	}

	override func tearDown() {
		self.cache = nil
		super.tearDown()
	}

	func test_InsertAndRemove() {
		let key1 = 1
		let value1 = IndexPath(row: 1, section: 1)
		self.cache.setValue(value1, forKey: key1)
		XCTAssertEqual(self.cache.value(forKey: key1), value1)
		self.cache.removeValue(forKey: key1)
		XCTAssertNil(self.cache.value(forKey: key1))
	}

	func test_InsertAndRemoveAll() {
		let key1 = 1
		let key2 = 2
		let value1 = IndexPath(row: 1, section: 1)
		let value2 = IndexPath(row: 2, section: 2)
		self.cache.setValue(value1, forKey: key1)
		self.cache.setValue(value2, forKey: key2)
		XCTAssertEqual(self.cache.value(forKey: key1), value1)
		XCTAssertEqual(self.cache.value(forKey: key2), value2)
		self.cache.removeAllValues()
		XCTAssertNil(self.cache.value(forKey: key1))
		XCTAssertNil(self.cache.value(forKey: key2))
	}

	func test_Subscript() {
		let key1 = 1
		let value1 = IndexPath(row: 1, section: 1)
		XCTAssertNil(self.cache[key1])

		self.cache[key1] = value1
		XCTAssertEqual(self.cache[key1], value1)

		self.cache[key1] = nil
		XCTAssertNil(self.cache.value(forKey: key1))
	}
}
