//
//  PersistentCodableList.swift
//  iOS
//
//  Created by Ondřej Hanák on 16. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation

public protocol ValueStorage {
	func value(forKey: String) -> Any?
	func setValue(_ value: Any?, forKey key: String)
}

extension UserDefaults: ValueStorage {}

/// Open for inheritance
open class PersistentCodableList<Item: Codable> {
	private var storage: ValueStorage

	public lazy var storageKey: String = {
		let prefix = "List"
		let listName = String(describing: self).components(separatedBy: ".").last ?? ""
		let key = prefix + "." + listName
		return key
	}()

	open var items: [Item] {
		get {
			guard let data = self.storage.value(forKey: self.storageKey) as? Data else { return [] }
			let decoder = JSONDecoder()
			let value = try? decoder.decode([Item].self, from: data)
			return value ?? []
		}
		set {
			let encoder = JSONEncoder()
			let data = try? encoder.encode(newValue)
			self.storage.setValue(data, forKey: self.storageKey)
		}
	}

	// MARK: - Lifecycle

	public init(_ storage: ValueStorage = UserDefaults.standard) {
		self.storage = storage
	}

	// MARK: - Open

	open func clear() {
		self.items = []
	}
}
