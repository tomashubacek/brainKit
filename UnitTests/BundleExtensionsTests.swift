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

	func testExistingTextFileStringLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadStringFromFile("HelloWorld.txt")
		XCTAssertNotNil(content)
	}

	func testNonExistingFileStringLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadStringFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func testExistingBinaryFileStringLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadStringFromFile("File.bin")
		XCTAssertNil(content)
	}

	func testExistingBinaryFileDataLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadDataFromFile("File.bin")
		XCTAssertNotNil(content)
	}

	func testNonExistingFileDataLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadDataFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func testExistingFilePlistLoad() {
		let bundle = Bundle(for: type(of: self))
		guard let content = bundle.loadPlistFromFile("HelloWorld.plist") else {
			XCTFail("Could not load plist.")
			return
		}
		let value = content["Hello"] as? String
		XCTAssertNotNil(value)
		XCTAssertEqual(value, "World")
	}

	func testNonExistingFilePlistLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadPlistFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func testNonExistingJSONLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadJSONFromFile("non-existing-file")
		XCTAssertNil(content)
	}

	func testExistingJSONLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadJSONFromFile("HelloWorld.json")
		guard let json = content else {
			XCTFail("JSON should not be nil.")
			return
		}
		XCTAssertEqual(json["hello"].stringValue, "world")
	}

	func testExistingNonJSONLoad() {
		let bundle = Bundle(for: type(of: self))
		let content = bundle.loadJSONFromFile("HelloWorld.txt")
		XCTAssertNil(content)
	}

	func testAppVersion() {
		let bundle = BundleMock()
		let expectation = bundle.appVersion
		XCTAssertEqual(expectation, "1.2.3")
	}

	func testBuildVersion() {
		let bundle = BundleMock()
		let expectation = bundle.buildVersion
		XCTAssertEqual(expectation, "123")
	}
}
