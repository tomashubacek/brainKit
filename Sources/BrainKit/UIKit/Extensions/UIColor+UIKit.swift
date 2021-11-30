//
//  UIColor+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 22. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIColor {
	public convenience init?(hexString: String) {
		var sanitizedHex = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
		if sanitizedHex.hasPrefix("#") {
			sanitizedHex.remove(at: sanitizedHex.startIndex)
		}
		guard sanitizedHex.count == 6 else { return nil }
		var rgbValue: UInt64 = 0
		let result = Scanner(string: sanitizedHex).scanHexInt64(&rgbValue)
		guard result else { return nil }
		let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
		let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
		self.init(red: red, green: green, blue: blue, alpha: 1)
	}

	public convenience init?(hexStringWithAlpha: String) {
		var sanitizedHex = hexStringWithAlpha.trimmingCharacters(in: .whitespacesAndNewlines)
		if sanitizedHex.hasPrefix("#") {
			sanitizedHex.remove(at: sanitizedHex.startIndex)
		}
		guard sanitizedHex.count == 8 else { return nil }
		var rgbValue: UInt64 = 0
		let result = Scanner(string: sanitizedHex).scanHexInt64(&rgbValue)
		guard result else { return nil }
		let red = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
		let green = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
		let blue = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
		let alpha = CGFloat(rgbValue & 0x000000FF) / 255.0
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}

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
		self.getRed(&r, green: &g, blue: &b, alpha: &a)
		return (r, g, b, a)
	}

	public var hsbComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0
		self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
		return (hue, saturation, brightness, alpha)
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
