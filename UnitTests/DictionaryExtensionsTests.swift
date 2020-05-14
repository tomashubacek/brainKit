//
//  DictionaryExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 05. 03. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import BrainKit
import XCTest

final class DictionaryExtensionsTests: XCTestCase {
	func test_PlusEqual() {
		var a = ["one": 1]
		let b = ["two": 2]
		a += b
		XCTAssertEqual(a, ["one": 1, "two": 2])
	}

	func test_Get_Existing() {
		let data = [
			"a": ["b": 123]
		]
		let x: Any? = data.value(forKeyPath: "a.b")
		XCTAssertEqual(x as? Int, 123)
	}

	func test_Get_Nonexisting() {
		let data = [
			"a": ["b": 123]
		]
		let x: Any? = data.value(forKeyPath: "a.x")
		XCTAssertNil(x)
	}

	func test_Get_WrongKeyType() {
		let data = [
			1: [2: "a"]
		]
		let x: Any? = data.value(forKeyPath: "1.2")
		XCTAssertNil(x)
	}

	func test_Set_WxistingSameType() {
		var data = [
			"a": ["b": 123]
		]
		data.setValue(val: 100, forKeyPath: "a.b")
		let x: Any? = data.value(forKeyPath: "a.b")
		XCTAssertEqual(x as? Int, 100)
	}

	func test_Set_ExistingDifferentType() {
		var data = [
			"a": ["b": 123]
		]
		data.setValue(val: "x", forKeyPath: "a.b")
		let x: Any? = data.value(forKeyPath: "a.b")
		XCTAssertEqual(x as? Int, 123)
	}

	func test_Set_WrongKeyType() {
		var data = [
			1: [2: "a"]
		]
		data.setValue(val: "a", forKeyPath: "1.2")
		XCTAssertEqual(data, [1: [2: "a"]])
	}
}
