//
//  UIViewController+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import UIKit

extension UIViewController {
	public func setAvoidKeyboard(_ enabled: Bool) {
		let notificationCenter = NotificationCenter.default
		if enabled {
			notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
			notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
		} else {
			notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
			notificationCenter.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
		}
	}

	// MARK: - Private

	@objc
	private func adjustForKeyboard(notification: Notification) {
		guard let window = self.view.window else { return }
		guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
		let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
		let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt

		let keyboardScreenEndFrame: CGRect = keyboardValue.cgRectValue
		// TODO: window provides frame information too early for .formSheet modals - we only know frame before animation, not after it
		let keyboardViewEndFrame = self.view.convert(keyboardScreenEndFrame, from: window)
		let lastBottomInset = self.view.safeAreaInsets.bottom

		var keyboardCoveredArea: CGFloat = 0
		if keyboardViewEndFrame.origin.y <= self.view.frame.size.height {
			keyboardCoveredArea = self.view.frame.size.height - keyboardViewEndFrame.origin.y
		}

		self.additionalSafeAreaInsets.bottom = 0 // always set to 0 to get unaltered safeAreaInsets

		if notification.name != UIResponder.keyboardWillHideNotification { // on hide keep additionalSafeAreaInsets on 0
			self.additionalSafeAreaInsets.bottom = keyboardCoveredArea - self.view.safeAreaInsets.bottom
		}

		guard abs(lastBottomInset - self.view.safeAreaInsets.bottom) > 45 else { return } // don't animate layout change on small difference. 45 is usually the height of the bar for autocomplete, and because it takes a moment to iOS to determine whether it's displayed or not, the adjustForKeyboard() fires twice. That causes visual jitter when navigating between fields and is not desired.
		guard lastBottomInset != self.view.safeAreaInsets.bottom else { return }

		UIView.animate(withDuration: duration, delay: 0, options: [UIView.AnimationOptions(rawValue: curve), .beginFromCurrentState], animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
}
