//
//  FloatingPoint+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 25. 06. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension FloatingPoint {
	public func map(from: ClosedRange<Self>, to: ClosedRange<Self>) -> Self {
		let value = self
		let fromSize = from.upperBound - from.lowerBound
		let toSize = to.upperBound - to.lowerBound
		return to.lowerBound + toSize * (value - from.lowerBound) / fromSize
	}
}
