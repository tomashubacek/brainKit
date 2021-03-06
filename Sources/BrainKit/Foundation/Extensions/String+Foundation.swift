//
//  String+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension String {
	public var data: Data {
		Data(self.utf8)
	}

	public func normalized() -> String {
		self.folding(options: .diacriticInsensitive, locale: .current).lowercased()
	}

	public func toBase64() -> String {
		self.data.base64EncodedString()
	}

	public func fromBase64() -> String? {
		guard let data = Data(base64Encoded: self) else { return nil }
		return data.string
	}

	public func removingNonBreakingSpaces() -> String {
		self.replacingOccurrences(of: "\u{00A0}", with: " ")
	}

	public mutating func removeNonBreakingSpaces() {
		self = self.removingNonBreakingSpaces()
	}

	public func trimmingWhitespacesAndNewlines() -> String {
		self.trimmingCharacters(in: .whitespacesAndNewlines)
	}

	public mutating func trimWhitespacesAndNewlines() {
		self = self.trimmingWhitespacesAndNewlines()
	}

	public func capitalizingFirstLetter() -> String {
		return self.prefix(1).capitalized + self.dropFirst()
	}

	public mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}

	public func reversedDomain() -> String {
		return self.components(separatedBy: ".").reversed().joined(separator: ".")
	}

	public var isValidEmail: Bool {
		let pattern = "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$" // from https://stackoverflow.com/a/201336/1548913
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
		return matches.count == 1
	}
}
