//
//  Double+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 21. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

// based on https://stackoverflow.com/a/35895607/1548913

public typealias Rational = (num: Int, den: Int)

extension Double {
	public func rationalApproximation(withPrecision eps: Double = 1.0e-6) -> Rational {
		var x = self
		var a = floor(x)
		var (h1, k1, h, k) = (1, 0, Int(a), 1)
		while x - a > eps * Double(k) * Double(k) {
			x = 1.0 / (x - a)
			a = floor(x)
			(h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
		}
		return (h, k)
	}
}
