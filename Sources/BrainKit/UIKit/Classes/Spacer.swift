//
//  Spacer.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 20. 09. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import UIKit

public final class Spacer: UIView {
	// MARK: - Lifecycle

	public init(size: CGSize = CGSize(width: 1, height: 1)) {
		super.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
		self.isUserInteractionEnabled = false
		self.backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
