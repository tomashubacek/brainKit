//
//  Array+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 25. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Array {
	public mutating func move(from: Int, to: Int) {
		guard from != to else { return }
		let count = self.count
		guard from >= 0, from < count else { return }
		guard to >= 0, to < count else { return }
		self.insert(self.remove(at: from), at: to)
	}

	public func chunked(into size: Int) -> [[Element]] {
		stride(from: 0, to: self.count, by: size).map {
			Array(self[$0 ..< Swift.min($0 + size, self.count)])
		}
	}
}
