//
//  NSAttributedString+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 15.10.2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation

extension NSAttributedString {
	// based on https://stackoverflow.com/a/54900313/1548913
	public func trimmingCharacters(in charSet: CharacterSet) -> NSAttributedString {
		let invertedSet = charSet.inverted
		let startRange = self.string.utf16.description.rangeOfCharacter(from: invertedSet)
		let endRange = self.string.utf16.description.rangeOfCharacter(from: invertedSet, options: .backwards)
		guard let startLocation = startRange?.upperBound, let endLocation = endRange?.lowerBound else {
			return NSAttributedString(string: self.string)
		}
		let location = self.string.utf16.distance(from: self.string.startIndex, to: startLocation) - 1
		let length = self.string.utf16.distance(from: startLocation, to: endLocation) + 2
		let range = NSRange(location: location, length: length)
		return attributedSubstring(from: range)
	}
}
