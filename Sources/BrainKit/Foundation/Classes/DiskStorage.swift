//
//  DiskStorage.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 05. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

final public class DiskStorage {
	private var subdirectoryName: String
	private var fileManager: FileManager
	lazy public var subdirectory: URL = {
		let paths = self.fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let documents = paths[0]
		let directory = documents.appendingPathComponent(self.subdirectoryName)
		return directory
	}()

	// MARK: - Lifecycle

	public init(subdirectory: String = "Storage", excludeFromBackup: Bool = false) throws {
		self.subdirectoryName = subdirectory
		self.fileManager = FileManager.default
		try self.fileManager.createDirectory(at: self.subdirectory, withIntermediateDirectories: true, attributes: nil)
		var resourceValues = URLResourceValues()
		resourceValues.isExcludedFromBackup = excludeFromBackup
		try self.subdirectory.setResourceValues(resourceValues)
	}

	// MARK: - Public

	public func hasFile(named: String) -> Bool {
		let url = self.urlOfFile(named: named)
		return url != nil
	}

	public func removeFile(named: String) throws {
		let url = self.makeURL(forFileNamed: named)
		try self.fileManager.removeItem(at: url)
	}

	public func urlOfFile(named: String) -> URL? {
		let url = self.makeURL(forFileNamed: named)
		let exists = self.fileManager.fileExists(atPath: url.path)
		return exists ? url : nil
	}

	public func dataFromFile(named: String) -> Data? {
		guard let url = self.urlOfFile(named: named) else { return nil }
		let data = try? Data(contentsOf: url)
		return data
	}

	public func saveData(_ data: Data, toFileNamed name: String) throws {
		let url = self.makeURL(forFileNamed: name)
		try data.write(to: url)
	}

	public func saveFile(from: URL, toFileNamed name: String) throws {
		let to = self.makeURL(forFileNamed: name)
		try self.fileManager.copyItem(at: from, to: to)
	}

	// MARK: - Private

	private func makeURL(forFileNamed name: String) -> URL {
		return self.subdirectory.appendingPathComponent(name)
	}
}
