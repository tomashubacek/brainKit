//
//  UIView+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 03. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIView {

	public func setShadow(withColor color: UIColor, opacity: Float, xOffset: Int, yOffset: Int, radius: CGFloat) {
		self.layer.shadowColor = color.cgColor
		self.layer.shadowOpacity = opacity
		self.layer.shadowOffset = CGSize(width: xOffset, height: yOffset)
		self.layer.shadowRadius = radius
	}

	public func setBorder(withColor color: UIColor, width: CGFloat) {
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = width
	}
}

