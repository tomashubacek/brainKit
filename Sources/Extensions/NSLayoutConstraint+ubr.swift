//
//  NSLayoutConstraint+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 07. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

final class HairlineConstraint: NSLayoutConstraint {
	override func awakeFromNib() {
		super.awakeFromNib()
		self.constant = .hairlineWidth
	}
}
