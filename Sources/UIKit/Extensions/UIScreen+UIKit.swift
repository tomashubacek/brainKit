//
//  UIScreen+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 15. 06. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import UIKit

extension UIScreen {
	@available(*, deprecated, message: "Use UIApplication.shared.topMostViewControllerBounds instead.")
	public static func correctBounds() -> CGRect {
		if let topMostViewController = UIApplication.shared.topMostViewController {
			return topMostViewController.view.bounds
		}
		return self.main.bounds
	}
}
