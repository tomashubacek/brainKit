//
//  UserDefaults+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension UserDefaults {
	public func set<T: Codable>(object: T, forKey: String) {
		// based on https://stackoverflow.com/a/50495944/1548913
		let data = try? JSONEncoder().encode(object)
		self.set(data, forKey: forKey)
	}

	public func get<T: Codable>(objectType: T.Type, forKey: String) -> T? {
		// based on https://stackoverflow.com/a/50495944/1548913
		guard let data = value(forKey: forKey) as? Data else { return nil }
		return try? JSONDecoder().decode(objectType, from: data)
	}
}
