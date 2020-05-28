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
	public static let shared = APIDateFormatter()

	override public init() {
		super.init()
		self.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
