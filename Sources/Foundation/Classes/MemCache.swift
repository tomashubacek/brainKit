//
//  MemCache.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 06. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

final public class MemCache<Key: Hashable, Value> {
	// based on https://www.swiftbysundell.com/articles/caching-in-swift/
	private let cache = NSCache<WrappedKey, WrappedValue>()

	// MARK: - Public

	public init() {}

	public func setValue(_ value: Value, forKey key: Key) {
		self.cache.setObject(WrappedValue(value: value), forKey: WrappedKey(key))
	}

	public func value(forKey key: Key) -> Value? {
		return self.cache.object(forKey: WrappedKey(key))?.value
	}

	public func removeValue(forKey key: Key) {
		self.cache.removeObject(forKey: WrappedKey(key))
	}

	public func removeAllValues() {
		self.cache.removeAllObjects()
	}
}

extension MemCache {
	public subscript(key: Key) -> Value? {
		get {
			self.value(forKey: key)
		}
		set {
			if let value = newValue {
				self.setValue(value, forKey: key)
			} else {
				self.removeValue(forKey: key)
			}
		}
	}
}

private extension MemCache {
	// Although Apple doc does not say that, keys needs to hashable of course. But just Hashable conformance does not work, needs to be subclass of NSObject.
	final class WrappedKey: NSObject {
		let key: Key

		init(_ key: Key) {
			self.key = key
		}

		override var hash: Int {
			key.hashValue
		}

		override func isEqual(_ object: Any?) -> Bool {
			guard let value = object as? WrappedKey else { return false }
			return value.key == self.key
		}
	}
}

private extension MemCache {
	final class WrappedValue {
		let value: Value

		init(value: Value) {
			self.value = value
		}
	}
}
