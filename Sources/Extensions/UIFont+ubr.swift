//
//  UIFont+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 03. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
extension UIFont {
	public static func preferredFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
		let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
		let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
		let metrics = UIFontMetrics(forTextStyle: style)
		return metrics.scaledFont(for: font)
	}
}
