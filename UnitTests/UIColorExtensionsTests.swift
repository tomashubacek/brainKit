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
	func test_hexString_wrongLength() {
		let str = "123"
		let color = UIColor(hexString: str)
		XCTAssertNil(color)
	}

	func test_hexString_wrongInput() {
		let str = "xxyyzz"
		let color = UIColor(hexString: str)
		XCTAssertNil(color)
	}

	func test_hexString_prefix() {
		let str = "#102030"
		let color = UIColor(hexString: str)!
		let components = color.rgbComponents
		XCTAssertEqual(components.red, CGFloat(16/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.green, CGFloat(32/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.blue, CGFloat(48/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.alpha, CGFloat(1))
	}

	func test_hexString_noPrefix() {
		let str = "102030"
		let color = UIColor(hexString: str)!
		let components = color.rgbComponents
		XCTAssertEqual(components.red, CGFloat(16/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.green, CGFloat(32/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.blue, CGFloat(48/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.alpha, CGFloat(1))
	}

	func test_hexStringAlpha_wrongLength() {
		let str = "1234567890"
		let color = UIColor(hexStringWithAlpha: str)
		XCTAssertNil(color)
	}

	func test_hexStringAlpha_wrongInput() {
		let str = "xxyyzz00"
		let color = UIColor(hexStringWithAlpha: str)
		XCTAssertNil(color)
	}

	func test_hexStringAlpha_prefix() {
		let str = "#10203040"
		guard let color = UIColor(hexStringWithAlpha: str) else { return XCTFail("Color string is valid, but init() failed.") }
		let components = color.rgbComponents
		XCTAssertEqual(components.red, CGFloat(16/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.green, CGFloat(32/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.blue, CGFloat(48/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.alpha, CGFloat(64/255.0), accuracy: 0.0001)
	}

	func test_hexStringAlpha_noPrefix() {
		let str = "10203040"
		guard let color = UIColor(hexStringWithAlpha: str) else { return XCTFail("Color string is valid, but init() failed.") }
		let components = color.rgbComponents
		XCTAssertEqual(components.red, CGFloat(16/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.green, CGFloat(32/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.blue, CGFloat(48/255.0), accuracy: 0.0001)
		XCTAssertEqual(components.alpha, CGFloat(64/255.0), accuracy: 0.0001)
	}

	func test_ImageFromColor() {
		// given
		let r = 50.0
		let g = 100.0
		let b = 150.0
		let a = 255.0 // other than 255 alters RGB values
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

	func test_hsbComponents() {
		let h = 0.125
		let s = 0.25
		let b = 0.5
		let a = 1 // other than 1 alters RGB values
		let color = UIColor(hue: CGFloat(h), saturation: CGFloat(s), brightness: CGFloat(b), alpha: CGFloat(a))

		let components = color.hsbComponents
		XCTAssertEqual(components.hue, CGFloat(h))
		XCTAssertEqual(components.saturation, CGFloat(s))
		XCTAssertEqual(components.brightness, CGFloat(b))
		XCTAssertEqual(components.alpha, CGFloat(a))
	}

	func test_rgbaComponents() {
		let r = 0.125
		let g = 0.25
		let b = 0.5
		let a = 1 // other than 1 alters RGB values
		let color = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))

		let components = color.rgbComponents
		XCTAssertEqual(components.red, CGFloat(r))
		XCTAssertEqual(components.green, CGFloat(g))
		XCTAssertEqual(components.blue, CGFloat(b))
		XCTAssertEqual(components.alpha, CGFloat(a))
	}

	func test_rgbHexColor() {
		let r = 17.0
		let g = 34.0
		let b = 51.0
		let a = 255.0 // other than 255 alters RGB values
		let color = UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: CGFloat(a / 255.0))

		let hexaColor = color.htmlRGBHexColor
		XCTAssertEqual(hexaColor, "#112233")
	}

	func test_rgbaHexColor() {
		let r = 17.0
		let g = 34.0
		let b = 51.0
		let a = 255.0 // other than 255 alters RGB values
		let color = UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: CGFloat(a / 255.0))

		let hexaColor = color.htmlRGBaHexColor
		XCTAssertEqual(hexaColor, "#112233ff")
	}
}
