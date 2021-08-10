//
//  PersistentCodableListTests.swift
//  iOS
//
//  Created by Ondřej Hanák on 05. 05. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import BrainKit
import XCTest

class TestStorage: ValueStorage {
	var data: Any?

	func value(forKey: String) -> Any? {
		return self.data
	}

	func setValue(_ value: Any?, forKey key: String) {
		self.data = value
	}
}

struct TestItem: Codable {
	var id: Int
}

class TestList: PersistentCodableList<TestItem> {}

final class PersistentCodableListTests: XCTestCase {
	func test_Persistence() {
		let storage = TestStorage()
		let list = TestList(storage)
		let id = Int.random(in: 1 ... 100)
		let item = TestItem(id: id)
		XCTAssertEqual(list.items.count, 0)
		list.items.append(item)
		XCTAssertEqual(list.items.count, 1)
		XCTAssertEqual(list.items[0].id, id)
	}

	func test_StorageKey() {
		let storage = TestStorage()
		let list = TestList(storage)
		XCTAssertEqual(list.storageKey, "List.TestList")
	}
}
