//
//  UIView+UIKit.swift
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

	public func setCorners(withRadius radius: CGFloat) {
		self.layer.cornerRadius = radius
	}

	@available(iOS 11, *)
	public func setCorners(withRadius radius: CGFloat, masked: CACornerMask? = nil) {
		self.setCorners(withRadius: radius)
		if let masked = masked {
			self.layer.maskedCorners = masked
		}
	}

	@available(iOS 13, *)
	public func setCorners(withRadius radius: CGFloat, masked: CACornerMask? = nil, curve: CALayerCornerCurve = .continuous) {
		self.setCorners(withRadius: radius, masked: masked)
		self.layer.cornerCurve = curve
	}
}

