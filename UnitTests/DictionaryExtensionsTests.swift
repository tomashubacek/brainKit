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

	func test_Plus() {
		let a = ["one": 1]
		let b = ["two": 2]
		let c = a + b
		XCTAssertEqual(c, ["one": 1, "two": 2])
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

	func test_Plist_Correct() {
		let date = Date()
		let input: [AnyHashable: Any] = [
			"array1": [],
			"array2": ["a", 1],
			"dict1": [:],
			"dict2": ["a": 1],
			"dict3": ["x": 123],
			"int": 123, "float": 1.33, "bool": true, "date": date
		]
		let expectation: [String: Any] = [
			"array1": [],
			"array2": ["a", 1],
			"dict1": [:],
			"dict2": ["a": 1],
			"dict3": ["x": 123],
			"int": 123, "float": 1.33, "bool": true, "date": date
		]
		let plist = input.plistCompatiblePart()
		let pDict = NSDictionary(dictionary: plist)
		let eDict = NSDictionary(dictionary: expectation)
		XCTAssertEqual(pDict, eDict)
	}

	func test_Plist_Wrong() {
		let input: [AnyHashable: Any] = [
			"array": [NSNull()],
			"dict1": ["a": 1, "index": IndexPath(row: 1, section: 1)],
			"dict2": ["x": 123, "y": NSNull()],
			"nil": NSNull(),
			12: "aa"
		]
		let expectation: [String: Any] = [
			"dict1": ["a": 1],
			"dict2": ["x": 123],
		]
		let plist = input.plistCompatiblePart()
		let pDict = NSDictionary(dictionary: plist)
		let eDict = NSDictionary(dictionary: expectation)
		XCTAssertEqual(pDict, eDict)
	}

}
