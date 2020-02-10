//
//  String+ubr.swift
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

}
