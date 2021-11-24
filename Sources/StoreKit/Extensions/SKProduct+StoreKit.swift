//
//  SKProduct+StoreKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 24.11.2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import StoreKit

@available(iOS 11.2, *)
extension SKProduct {
	public var hasIntroPrice: Bool {
		guard let mode = self.introductoryPrice?.paymentMode else { return false }
		return mode == .payAsYouGo || mode == .payUpFront
	}

	public var hasFreeTrial: Bool {
		guard let mode = self.introductoryPrice?.paymentMode else { return false }
		return mode == .freeTrial
	}
}
