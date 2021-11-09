//
//  PeriodUnit+StoreKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09.11.2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

// based on https://stackoverflow.com/a/56870047/1548913

import StoreKit

@available(iOS 11.2, *)
extension SKProduct.PeriodUnit {
	public func toCalendarUnit() -> NSCalendar.Unit {
		switch self {
		case .day:
			return .day
		case .month:
			return .month
		case .week:
			return .weekOfMonth
		case .year:
			return .year
		default:
			return .day
		}
	}
}
