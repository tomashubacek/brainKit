//
//  TestCoreDataTestCase.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 08. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import XCTest
import BrainKit

class TestCoreDataTestCase: XCTestCase {
	var coreDataContainer: CoreDataContainer!

	override func setUp() {
		super.setUp()
		self.coreDataContainer = CoreDataContainer(modelName: "Testing", bundle: self.testBundle, storageType: .inMemory)
	}

	override func tearDown() {
		self.coreDataContainer = nil
		super.tearDown()
	}
}
