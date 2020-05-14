//
//  StoryboardInstantiable.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 09. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation
import BrainKit
import XCTest

final class StoryboardInstantiableTests: XCTestCase {

	func test_Instantiation() {
		let bundle = Bundle(for: type(of: self))
		_ = StoryboardViewController.instantiateFromStoryboard(from: bundle)
	}
}
