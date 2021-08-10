//
//  UserDefaultsExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import XCTest

struct Item: Codable, Equatable {
	var value: String
	static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.value == rhs.value
	}
}

final class UserDefaultsExtensionsTests: XCTestCase {
	func test_SetAndGetObject() {
		let input = [Item(value: "a"), Item(value: "b")]
		let userDefaults = UserDefaults.standard
		userDefaults.set(object: input, forKey: "data")
		let output = userDefaults.get(objectType: [Item].self, forKey: "data")
		XCTAssertEqual(input, output)
	}

	func test_GetNonexistingObject() {
		let userDefaults = UserDefaults.standard
		let output = userDefaults.get(objectType: Int.self, forKey: "nont-existing-key")
		XCTAssertNil(output)
	}
}
