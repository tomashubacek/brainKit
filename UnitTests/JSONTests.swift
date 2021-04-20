//
//  JSONTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 20. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest

final class JSONTests: XCTestCase {
	func test_UUID() {
		let uuid = UUID()
		var json = JSON([:])

		XCTAssertNil(json["uuid"].uuid)

		json["uuid"].uuid = uuid

		XCTAssertEqual(json["uuid"].uuid, uuid)
	}
}
