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
}
