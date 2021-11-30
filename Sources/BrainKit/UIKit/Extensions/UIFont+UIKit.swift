//
//  UIFont+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 03. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIFont {
	public static func preferredFont(forTextStyle style: TextStyle, weight: Weight, maxSize: CGFloat = CGFloat.greatestFiniteMagnitude) -> UIFont {
		let preferred = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
		let size = min(preferred.pointSize, maxSize)
		let font = UIFont.systemFont(ofSize: size, weight: weight)
		return font
	}

	@available(iOS 13.0, *)
	public static func preferredFont(forTextStyle style: TextStyle, weight: Weight, design: UIFontDescriptor.SystemDesign = .default, maxSize: CGFloat = CGFloat.greatestFiniteMagnitude) -> UIFont {
		let preferred = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
		let size = min(preferred.pointSize, maxSize)
		var font = UIFont.systemFont(ofSize: size, weight: weight)
		if let desc = font.fontDescriptor.withDesign(design) {
			font = UIFont(descriptor: desc, size: size)
		}
		return font
	}

	@available(iOS 13.0, *)
	public static func systemFont(ofSize size: CGFloat, weight: Weight, design: UIFontDescriptor.SystemDesign = .default) -> UIFont {
		var font = UIFont.systemFont(ofSize: size, weight: weight)
		if let desc = font.fontDescriptor.withDesign(design) {
			font = UIFont(descriptor: desc, size: size)
		}
		return font
	}
}
