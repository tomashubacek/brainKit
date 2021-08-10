//
//  UIStackViewTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 10. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import BrainKit
import XCTest

final class UIStackViewTests: XCTestCase {
	func test_AddSubviews() {
		let view = UIView()
		let stack = UIStackView()
		stack.addArrangedSubviews([view])
		XCTAssertTrue(stack.arrangedSubviews.contains(view))
	}

	func test_RemoveAllArrangedSubviews() {
		let view = UIView()
		let stack = UIStackView(arrangedSubviews: [view])
		stack.removeAllArrangedSubviews()
		XCTAssertTrue(stack.arrangedSubviews.isEmpty)
	}

	func test_SetPadding() {
		let stack = UIStackView()
		let top = CGFloat(Int.random(in: 1 ... 100))
		let leading = CGFloat(Int.random(in: 1 ... 100))
		let bottom = CGFloat(Int.random(in: 1 ... 100))
		let trailing = CGFloat(Int.random(in: 1 ... 100))
		stack.setPadding(top: top, leading: leading, bottom: bottom, trailing: trailing)
		XCTAssertTrue(stack.isLayoutMarginsRelativeArrangement)
		XCTAssertEqual(stack.directionalLayoutMargins.top, top)
		XCTAssertEqual(stack.directionalLayoutMargins.leading, leading)
		XCTAssertEqual(stack.directionalLayoutMargins.bottom, bottom)
		XCTAssertEqual(stack.directionalLayoutMargins.trailing, trailing)
	}
}
