//
//  UILabel+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 06. 08. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UILabel {
	public func setLineHeight(_ lineHeight: CGFloat) {
		guard let text = self.text else { return }
		let attributeString = NSMutableAttributedString(string: text)
		let style = NSMutableParagraphStyle()
		style.lineSpacing = lineHeight
		attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, attributeString.length))
		self.attributedText = attributeString
	}

	public func setLineHeightMultiple(_ lineHeightMultiple: CGFloat) {
		guard let text = self.text else { return }
		let attributeString = NSMutableAttributedString(string: text)
		let style = NSMutableParagraphStyle()
		style.lineHeightMultiple = lineHeightMultiple
		attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, attributeString.length))
		self.attributedText = attributeString
	}
}
