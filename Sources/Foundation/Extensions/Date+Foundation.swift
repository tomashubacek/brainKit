//
//  Date+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 29. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Date {
	static public func from(dateString: String) -> Date? {
		let dateParts = dateString.components(separatedBy: "-")
		guard dateParts.count == 3 else { return nil }
		var components = DateComponents()
		components.year = Int(dateParts[0])
		components.month = Int(dateParts[1])
		components.day = Int(dateParts[2])
		let date = Calendar.current.date(from: components)
		return date
	}
}
