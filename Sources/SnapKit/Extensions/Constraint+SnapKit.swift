//
//  Constraint+SnapKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 22. 02. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import SnapKit

extension Constraint {
	public static func set(activated activatedConstraints: [Constraint] = [], deactivated deactivatedConstraints: [Constraint] = []) {
		deactivatedConstraints.forEach { $0.deactivate() }
		activatedConstraints.forEach { $0.activate() }
	}

	public static func set(activated activatedConstraint: Constraint?, deactivated deactivatedConstraint: Constraint?) {
		deactivatedConstraint?.deactivate()
		activatedConstraint?.activate()
	}
}
