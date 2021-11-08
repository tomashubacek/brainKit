//
//  UIApplication+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 30. 03. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import UIKit

extension UIApplication {
	@available(iOS 13.0, *)
	public static var statusBarFrame: CGRect {
		let window = UIApplication.shared.windows.first { $0.isKeyWindow }
		let frame = window?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
		return frame
	}

	public static var interfaceOrientation: UIInterfaceOrientation {
		if #available(iOS 13, *) {
			let window = UIApplication.shared.windows.first { $0.isKeyWindow }
			let orinetation = window?.windowScene?.interfaceOrientation
			return orinetation ?? .unknown
		} else {
			return UIApplication.shared.statusBarOrientation
		}
	}

	public var topMostViewController: UIViewController? {
		let keyWindow = self.windows.first { $0.isKeyWindow }
		if var topController = keyWindow?.rootViewController {
			while let presentedViewController = topController.presentedViewController {
				topController = presentedViewController
			}
			return topController
		}
		return nil
	}

	public var topMostViewControllerBounds: CGRect {
		guard let topMostViewController = self.topMostViewController else { return UIScreen.main.bounds }
		return topMostViewController.view.bounds
	}
}
