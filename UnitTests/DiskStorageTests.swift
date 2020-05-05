//
//  DiskStorageTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 05. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import XCTest
import BrainKit

final class DiskStorageTests: XCTestCase {
	lazy var fileName1: String = {
		"file1"
	}()
	lazy var fileName2: String = {
		"file2"
	}()
	lazy var nonexistingFileName: String = {
		"some-probably-nonexisting-file"
	}()
	lazy var dataContent: Data = {
		"Hello world!".data(using: .utf8)!
	}()

	var storage: DiskStorage!

	override func setUp() {
		super.setUp()
		let dir = UUID().uuidString
		self.storage = try! DiskStorage(subdirectory: dir)
	}

	override func tearDown() {
		super.tearDown()
		try? self.storage.removeFile(named: self.fileName1)
		try? self.storage.removeFile(named: self.fileName2)
		print("TEAR")
	}

	func test_existence_existing() {
		try? self.storage.saveData(self.dataContent, toFileNamed: self.fileName1)
		let exists = self.storage.hasFile(named: self.fileName1)
		XCTAssertTrue(exists)
	}

	func test_existence_nonexisting() {
		let exists = self.storage.hasFile(named: self.nonexistingFileName)
		XCTAssertFalse(exists)
	}

	func test_load_existing() {
		try? self.storage.saveData(self.dataContent, toFileNamed: self.fileName1)
		let data = self.storage.dataFromFile(named: self.fileName1)
		XCTAssertEqual(self.dataContent, data)
	}

	func test_load_nonexisting() {
		let data = self.storage.dataFromFile(named: self.nonexistingFileName)
		XCTAssertNil(data)
	}

	func test_removal_existing() {
		try? self.storage.saveData(self.dataContent, toFileNamed: self.fileName1)
		XCTAssertTrue(storage.hasFile(named: self.fileName1))
		try? self.storage.removeFile(named: self.fileName1)
		XCTAssertFalse(storage.hasFile(named: self.fileName1))
	}

	func test_removal_nonexisting() {
		do {
			try self.storage.removeFile(named: self.nonexistingFileName)
			XCTFail("Should throw.")
		} catch {
		}
	}

	func test_savingFile_existing() {
		try? self.storage.saveData(self.dataContent, toFileNamed: self.fileName1)
		let url = storage.urlOfFile(named: self.fileName1)!
		try? self.storage.saveFile(from: url, toFileNamed: self.fileName2)
		let data = self.storage.dataFromFile(named: self.fileName2)
		XCTAssertEqual(self.dataContent, data)
	}

	func test_savingFile_nonexisting() {
		let url = self.storage.subdirectory.appendingPathComponent(self.nonexistingFileName)
		do {
			try self.storage.saveFile(from: url, toFileNamed: self.fileName2)
			XCTFail("Shoud throw.")
		} catch {
		}
	}

	func test_exclusionFromBackup_true() {
		let local = try! DiskStorage(subdirectory: "test", excludeFromBackup: true)
		let values = try! local.subdirectory.resourceValues(forKeys: [.isExcludedFromBackupKey])
		XCTAssertTrue(values.isExcludedFromBackup!)
	}

	func test_exclusionFromBackup_false() {
		let local = try! DiskStorage(subdirectory: "test", excludeFromBackup: false)
		let values = try! local.subdirectory.resourceValues(forKeys: [.isExcludedFromBackupKey])
		XCTAssertFalse(values.isExcludedFromBackup!)
	}

	func test_subdirectoryName() {
		let local = try! DiskStorage(subdirectory: "my-subdirectory", excludeFromBackup: true)
		let path = local.subdirectory.path
		XCTAssertTrue(path.hasSuffix("my-subdirectory"))
	}
}
