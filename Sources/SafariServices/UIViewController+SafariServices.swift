//
//  UIViewController+SafariServices.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 21. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import SafariServices

extension UIViewController {
	public func presentWebBrowser(_ url: URL, tintColor: UIColor? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
		let browser = SFSafariViewController(url: url)
		browser.modalPresentationStyle = .fullScreen
		browser.modalTransitionStyle = .coverVertical
		if let tintColor = tintColor {
			browser.preferredControlTintColor = tintColor
		}
		self.present(browser, animated: animated, completion: completion)
	}
}
