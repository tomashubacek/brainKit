//
//  ObjectManagerTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 08. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest
import BrainKit

final class ObjectManagerTests: TestCoreDataTestCase {
	func test_Fetch() {
		let maxID = 4
		for i in 1 ... maxID {
			let e = TestingEntity(context: self.coreDataContainer.mainContext)
			e.id = Int64(i)
		}
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		let predicate = NSPredicate(format: "id < %i", maxID)
		let sort = NSSortDescriptor(key: "id", ascending: false)
		let limit = 3

		let result = manager.fetch(predicate: predicate, sortDescriptors: [sort], limit: limit)

		XCTAssertEqual(result.count, limit)

		let first = result[0]
		XCTAssertEqual(first.id, Int64(maxID - 1))
	}

	func test_FindByIDInOrder() {
		for i in 1 ... 4 {
			let e = TestingEntity(context: self.coreDataContainer.mainContext)
			e.id = Int64(i)
		}
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		let result = manager.findInOrder(withIDs: [3, 20, 2])

		XCTAssertEqual(result.count, 2)
		XCTAssertEqual(result.first?.id, 3)
		XCTAssertEqual(result.last?.id, 2)
	}

	func test_FindByID() {
		let id = Int64(10)
		let e = TestingEntity(context: self.coreDataContainer.mainContext)
		e.id = id
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		let result = manager.find(withID: id)
		XCTAssertNotNil(result)
		XCTAssertEqual(result?.id, id)
	}

	func test_Insert() {
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		_ = manager.insert()
		_ = manager.insert()
		let all = manager.fetch(predicate: NSPredicate(value: true))
		XCTAssertEqual(all.count, 2)
	}

	func test_FindOrInsert() {
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		let e1 = manager.findOrInsert(withID: 1)
		let e2 = manager.findOrInsert(withID: 1)
		let entities = manager.fetch(predicate: NSPredicate(value: true), sortDescriptors: nil, limit: nil)
		XCTAssertEqual(entities.count, 1)
		XCTAssertEqual(e1.objectID, e2.objectID)
	}

	func test_Delete() {
		let id = Int64(10)
		let e = TestingEntity(context: self.coreDataContainer.mainContext)
		e.id = id
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		var result = manager.find(withID: id)
		XCTAssertNotNil(result)
		manager.delete(withID: id)
		result = manager.find(withID: id)
		XCTAssertNil(result)
	}

	func test_InsertFromJSON() {
		let manager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		_ = manager.insert(from: JSON(["id": 1]))
		_ = manager.insert(from: JSON(["id": 2]))
		let all = manager.fetch(predicate: NSPredicate(value: true))
		XCTAssertEqual(all.count, 2)
		XCTAssertNotNil(all.firstIndex { $0.id == 1 })
		XCTAssertNotNil(all.firstIndex { $0.id == 2 })
	}
}
