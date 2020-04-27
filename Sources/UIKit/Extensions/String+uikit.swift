//
//  String+uikit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension String {
	public func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
		let rect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let bounds = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		return ceil(bounds.width)
	}

	public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
		let rect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let bounds = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		return ceil(bounds.height)
	}
}
