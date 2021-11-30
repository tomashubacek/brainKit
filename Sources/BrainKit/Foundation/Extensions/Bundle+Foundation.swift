//
//  Bundle+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 20. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Bundle {
	public func loadStringFromFile(_ name: String) -> String? {
		guard let path = self.path(forResource: name, ofType: nil) else { return nil }
		return try? String(contentsOfFile: path)
	}

	public func loadDataFromFile(_ name: String) -> Data? {
		guard let url = self.url(forResource: name, withExtension: nil) else { return nil }
		return try? Data(contentsOf: url)
	}

	public func loadPlistFromFile(_ name: String) -> [String: Any]? {
		guard let url = self.url(forResource: name, withExtension: nil) else { return nil }
		guard let data = try? Data(contentsOf: url) else { return nil }
		guard let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) else { return nil }
		guard let dictionary = plist as? [String: Any] else { return nil }
		return dictionary
	}

	public var buildVersion: String {
		guard let str = self.object(forInfoDictionaryKey: "CFBundleVersion") as? String else { return "" }
		return str
	}

	public var appVersion: String {
		guard let str = self.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else { return "" }
		return str
	}
}
