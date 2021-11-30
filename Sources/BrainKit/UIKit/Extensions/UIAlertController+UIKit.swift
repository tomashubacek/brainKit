//
//  UIAlertController+UIKit.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 21. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIAlertController {
	public static func makeAlert(title: String?, message: String?) -> UIAlertController {
		return UIAlertController(title: title, message: message, preferredStyle: .alert)
	}

	public static func makeActionSheet(title: String?, message: String?) -> UIAlertController {
		return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
	}

	@discardableResult
	public func addAction(title: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
		let action = UIAlertAction(title: title, style: style, handler: handler)
		self.addAction(action)
		return action
	}

	@discardableResult
	public func addDefaultAction(title: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
		return self.addAction(title: title, style: .default, handler: handler)
	}

	@discardableResult
	public func addDestructiveAction(title: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
		return self.addAction(title: title, style: .destructive, handler: handler)
	}

	@discardableResult
	public func addCancelAction(title: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
		return self.addAction(title: title, style: .cancel, handler: handler)
	}

	@discardableResult
	public func addCancelAction(title: String) -> UIAlertAction {
		return self.addCancelAction(title: title, handler: nil)
	}
}
