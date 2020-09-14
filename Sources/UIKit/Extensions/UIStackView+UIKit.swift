//
//  UIStackView+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 06. 08. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIStackView {
	public func addArrangedSubviews(_ views: [UIView]) {
		views.forEach { self.addArrangedSubview($0) }
	}

	public func removeAllArrangedSubviews() {
		self.arrangedSubviews.forEach { self.removeArrangedSubview($0) }
	}

	@available(iOS 11, *)
	public func setPadding(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
		self.isLayoutMarginsRelativeArrangement = true
		self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
	}
}
