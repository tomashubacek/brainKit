//
//  FloatingPoint+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 25. 06. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension FloatingPoint {
	public func map(from: (Self, Self), to: (Self, Self)) -> Self {
		let value = self
		let fromSize = from.1 - from.0
		guard fromSize != 0 else { return Self.nan }
		let toSize = to.1 - to.0
		return to.0 + toSize * (value - from.0) / fromSize
	}
}
