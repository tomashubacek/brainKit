//
//  UIColorExtensionsTests.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 22. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import BrainKit
import XCTest

final class UIColorExtensionsTests: XCTestCase {

	func testImageFromColor() {
		// given
		let r = 50.0
		let g = 100.0
		let b = 150.0
		let a = 255.0 // othet than 255 alters RGB values
		let color = UIColor(red: CGFloat(r / 255), green: CGFloat(g / 255), blue: CGFloat(b / 255), alpha: CGFloat(a / 255))
		let size = CGSize(width: 10, height: 20)

		// when
		let image = color.image(size: size)
		let imageSize = image.size
		let imageData = image.cgImage!.dataProvider!.data!
		let colorData: UnsafePointer<UInt8> = CFDataGetBytePtr(imageData)
		let imageR = Double(colorData[0])
		let imageG = Double(colorData[1])
		let imageB = Double(colorData[2])
		let imageA = Double(colorData[3])

		// then
		XCTAssertEqual(size, imageSize)
		XCTAssertEqual(r, imageR)
		XCTAssertEqual(g, imageG)
		XCTAssertEqual(b, imageB)
		XCTAssertEqual(a, imageA)
	}
}
