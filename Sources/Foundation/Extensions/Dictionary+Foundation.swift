//
//  Dictionary+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 22. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

// adapted from https://gist.github.com/LoganWright/fef555b38c3438565793

extension Dictionary {
	public static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
		rhs.forEach { lhs[$0] = $1 }
	}

	public static func + (lhs: [Key : Value], rhs: [Key : Value]) -> [Key : Value] {
		var result = lhs
		result += rhs
		return result
	}

	public mutating func setValue(val: Any, forKeyPath keyPath: String) {
		var keys = keyPath.components(separatedBy: ".")
		guard let first = keys.first as? Key else {
			// Unable to use string as key on type: Key.self
			return
		}
		keys.remove(at: 0)
		if keys.isEmpty, let settable = val as? Value {
			self[first] = settable
		} else {
			let rejoined = keys.joined(separator: ".")
			var subdict: [AnyHashable: Any] = [:]
			if let sub = self[first] as? [AnyHashable: Any] {
				subdict = sub
			}
			subdict.setValue(val: val, forKeyPath: rejoined)
			if let settable = subdict as? Value {
				self[first] = settable
			}
		}
	}

	public func value<T>(forKeyPath keyPath: String) -> T? {
		var keys = keyPath.components(separatedBy: ".")
		guard let first = keys.first as? Key else {
			// Unable to use string as key on type: Key.self
			return nil
		}
		guard let value = self[first] else {
			return nil
		}
		keys.remove(at: 0)
		if !keys.isEmpty, let subDict = value as? [AnyHashable: Any] {
			let rejoined = keys.joined(separator: ".")
			return subDict.value(forKeyPath: rejoined)
		}
		return value as? T
	}

	/// Returns dictionary without plist representable keys and values.
	public func plistCompatiblePart() -> [String: Any] {
		self.reduce(into: Dictionary<String, Any>()) { result, pair in
			guard let key = pair.key as? String else { return }
			if let dict = pair.value as? Self {
				result[key] = dict.plistCompatiblePart()
				return
			}
			let plist = try? PropertyListSerialization.data(fromPropertyList: pair.value, format: .xml, options: 0)
			guard plist != nil else { return }
			result[key] = pair.value
		}
	}
}
