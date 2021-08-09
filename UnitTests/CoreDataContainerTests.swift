//
//  CoreDataContainerTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 08. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import BrainKit
import XCTest

final class CoreDataContainerTests: TestCoreDataTestCase {
	func test_MainContextType() {
		let context = self.coreDataContainer.mainContext
		XCTAssertEqual(context.concurrencyType, .mainQueueConcurrencyType)
	}

	func test_BackgroundContextType() {
		let context = self.coreDataContainer.newBackgroundContext()
		XCTAssertEqual(context.concurrencyType, .privateQueueConcurrencyType)
	}

	func test_BackgroundContextUnique() {
		let context1 = self.coreDataContainer.newBackgroundContext()
		let context2 = self.coreDataContainer.newBackgroundContext()
		XCTAssertNotEqual(context1, context2)
	}

	func test_ExplicitName() {
		XCTAssertEqual(self.coreDataContainer.persistenceContainer.name, "Testing")
	}
}
