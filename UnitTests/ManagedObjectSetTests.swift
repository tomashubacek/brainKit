//
//  ManagedObjectSetTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import XCTest
import BrainKit

final class ManagedObjectSetTests: TestCoreDataTestCase {
	func test_DeleteAll() {
		let tManager = ObjectManager<TestingEntity>(context: self.coreDataContainer.mainContext)
		let testing = tManager.findOrInsert(withID: 1)
		let rManager = ObjectManager<RelatedEntity>(context: self.coreDataContainer.mainContext)
		let r1 = rManager.insert()
		let r2 = rManager.insert()
		r1.testing = testing
		r2.testing = testing
		XCTAssertEqual(testing.related.count, 2)
		testing.related.deleteAll()
		testing.managedObjectContext?.processPendingChanges()
		XCTAssertEqual(testing.related.count, 0)
	}
}
