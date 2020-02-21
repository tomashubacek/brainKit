//
//  Bundle+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 20. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Bundle {
	public func loadStringFromFile(_ name: String) -> String? {
		guard let path = self.path(forResource: name, ofType: nil) else {
			return nil
		}
		do {
			return try String(contentsOfFile: path)
		} catch {
			return nil
		}
	}

	public func loadDataFromFile(_ name: String) -> Data? {
		guard let url = self.url(forResource: name, withExtension: nil) else {
			return nil
		}
		do {
			return try Data(contentsOf: url)
		} catch {
			return nil
		}
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
