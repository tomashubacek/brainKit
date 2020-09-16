//
//  PriceFormatter.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 14. 09. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

final public class PriceFormatter: NumberFormatter {
	public init(locale: Locale) {
		super.init()
		self.formatterBehavior = .behavior10_4
		self.numberStyle = .currency
		self.locale = locale
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
