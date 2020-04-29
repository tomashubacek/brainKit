//
//  APIDateFormatter.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 29. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

@available(iOS 11, *)
final public class APIDateFormatter: ISO8601DateFormatter {
	override public init() {
		super.init()
		self.setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		self.setup()
	}

	private func setup() {
		self.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
	}
}
