//
//  SKProductDiscount+StoreKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09.11.2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

// based on https://stackoverflow.com/a/56870047/1548913

import StoreKit

final private class SubscriptionPeriodFormatter {
	static var componentFormatter: DateComponentsFormatter {
		let formatter = DateComponentsFormatter()
		formatter.maximumUnitCount = 1
		formatter.unitsStyle = .full
		formatter.zeroFormattingBehavior = .dropAll
		return formatter
	}

	static func format(unit: NSCalendar.Unit, numberOfUnits: Int) -> String? {
		var dateComponents = DateComponents()
		dateComponents.calendar = Calendar.current
		componentFormatter.allowedUnits = [unit]
		switch unit {
		case .day:
			dateComponents.setValue(numberOfUnits, for: .day)
		case .weekOfMonth:
			dateComponents.setValue(numberOfUnits, for: .weekOfMonth)
		case .month:
			dateComponents.setValue(numberOfUnits, for: .month)
		case .year:
			dateComponents.setValue(numberOfUnits, for: .year)
		default:
			return nil
		}

		return componentFormatter.string(from: dateComponents)
	}
}

@available(iOS 11.2, *)
extension SKProductDiscount {
	public func localizedPeriod() -> String? {
		switch self.paymentMode {
		case .freeTrial:
			return SubscriptionPeriodFormatter.format(unit: self.subscriptionPeriod.unit.toCalendarUnit(), numberOfUnits: self.subscriptionPeriod.numberOfUnits)
		case .payUpFront, .payAsYouGo:
			return SubscriptionPeriodFormatter.format(unit: self.subscriptionPeriod.unit.toCalendarUnit(), numberOfUnits: self.numberOfPeriods)
		}
	}
}
