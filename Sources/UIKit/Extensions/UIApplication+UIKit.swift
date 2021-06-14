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
}
