//
//  RunOnce.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 19. 05. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation

final public class RunOnce {
	private(set) var blockToRun: () -> Void = {}
	private lazy var runner: Void = {
		self.blockToRun()
	}()

	// MARK: - Lifecycle

	public init() {}

	// MARK: - Public

	public func runOnce(_ block: @escaping () -> Void) {
		self.blockToRun = block
		_ = self.runner
	}
}
