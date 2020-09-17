//
//  UIFont+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 03. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIFont {
	public static func preferredFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
		let preferred = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
		let size = preferred.pointSize
		let font = UIFont.systemFont(ofSize: size, weight: weight)
		return font
	}

	@available(iOS 13.0, *)
	public static func preferredFont(forTextStyle style: TextStyle, weight: Weight, design: UIFontDescriptor.SystemDesign = .default) -> UIFont {
		let preferred = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
		let size = preferred.pointSize
		var font = UIFont.systemFont(ofSize: size, weight: weight)
		if let desc = font.fontDescriptor.withDesign(design) {
			font = UIFont(descriptor: desc, size: size)
		}
		return font
	}
}
