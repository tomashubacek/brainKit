//
//  BundleExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 20. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import BrainKit
import XCTest
import SwiftyJSON

final class BundleMock: Bundle {
	override func object(forInfoDictionaryKey key: String) -> Any? {
		if key == "CFBundleVersion" {
			return "123" // build
		} else if key == "CFBundleShortVersionString" {
			return "1.2.3" // app
		} else {
			return nil
		}
	}
}

final class BundleExtensionsTests: XCTestCase {
	func test_StringLoad_ExistingTextFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadStringFromFile("HelloWorld.txt")
		XCTAssertNotNil(content)
	}

	func test_StringLoad_ExistingBinaryFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadStringFromFile("File.bin")
		XCTAssertNil(content)
	}

	func test_StringLoad_NonExistingFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadStringFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func test_DataLoad_ExistingBinaryFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadDataFromFile("File.bin")
		XCTAssertNotNil(content)
	}

	func test_DataLoad_NonExistingFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadDataFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func test_PlistLoad_ExistingFile() {
		let bundle = Bundle(for: type(of: self))
		guard let content = bundle.loadPlistFromFile("HelloWorld.plist") else {
			XCTFail("Could not load plist.")
			return
		}
		let value = content["Hello"] as? String
		XCTAssertNotNil(value)
		XCTAssertEqual(value, "World")
	}

	func test_PlistLoad_NonExistingFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadPlistFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func test_JSONLoad_ExistingFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadJSONFromFile("HelloWorld.json")
		guard let json = content else {
			XCTFail("JSON should not be nil.")
			return
		}
		XCTAssertEqual(json["hello"].stringValue, "world")
	}

	func test_JSONLoad_ExistingNonJSONFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadJSONFromFile("HelloWorld.txt")
		XCTAssertNil(content)
	}

	func test_JSONLoad_NonExistingFile() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadJSONFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func test_AppVersion() {
		let bundle = BundleMock()
		let expectation = bundle.appVersion
		XCTAssertEqual(expectation, "1.2.3")
	}

	func test_BuildVersion() {
		let bundle = BundleMock()
		let expectation = bundle.buildVersion
		XCTAssertEqual(expectation, "123")
	}
}
