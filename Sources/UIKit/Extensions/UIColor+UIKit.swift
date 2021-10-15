//
//  UIColor+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 22. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIColor {
	public func image(size: CGSize) -> UIImage {
		UIGraphicsImageRenderer(size: size).image { rendererContext in
			self.setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}

	public var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
			return (r, g, b, a)
		}
		return (0, 0, 0, 0)
	}

	public var hsbComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0
		if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
			return (hue, saturation, brightness, alpha)
		}
		return (0, 0, 0, 0)
	}

	public var htmlRGBHexColor: String {
		let components = self.rgbComponents
		return String(format: "#%02x%02x%02x", Int(components.red * 255), Int(components.green * 255), Int(components.blue * 255))
	}

	public var htmlRGBaHexColor: String {
		let components = self.rgbComponents
		return String(format: "#%02x%02x%02x%02x", Int(components.red * 255), Int(components.green * 255), Int(components.blue * 255), Int(components.alpha * 255) )
	}
}
