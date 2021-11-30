//
//  UIWindow+UIKit.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 28. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIWindow {
	public func setRootViewController(_ vc: UIViewController, animated: Bool) {
		self.rootViewController = vc
		if animated {
			UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
		}
	}
}
