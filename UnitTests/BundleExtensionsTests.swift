//
//  BundleExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 20. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import BrainKit
import XCTest

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
		let content = bundle.loadStringFromFile("DefinitelyNotExistingFile.txt")
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
		let content = bundle.loadDataFromFile("DefinitelyNotExistingFile.txt")
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
