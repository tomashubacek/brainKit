//
//  UINavigationBar+ext.swift
//  BrainKit
//
//  Created by Jakub Heglas on 22/07/2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UINavigationBar {
	public func makeTransparent() {
		self.setBackgroundImage(UIImage(), for: .default)
		self.shadowImage = UIImage()
		self.setValue(true, forKey: "hidesShadow") // hides border on iOS12
		self.isTranslucent = true
	}

	public func makeOpaque(with color: UIColor) {
		self.makeTransparent()
		self.backgroundColor = color
	}
}
