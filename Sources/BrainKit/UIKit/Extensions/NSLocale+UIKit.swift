//
//  NSLocale+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 06. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

// based on https://stackoverflow.com/a/29603376/1548913

extension NSLocale {

	// at 72 DPI
	private struct PaperSize  {
		static let letter = CGSize(width: 612, height: 792) // ANSI A
		static let a4 = CGSize(width: 595.2, height: 841.8) // ISO 216 A4
	}

	private static let LetterCountries : Set<String> = ["US", "CA", "MX", "CU", "DO", "GT", "CR", "SV", "HN", "BO", "CO", "VE", "PH", "CL"]

	@objc
	public static func defaultPaperSize() -> CGSize {
		let locale = self.current
		let regionCode = locale.regionCode?.uppercased() ?? ""
		let isAnsi = LetterCountries.contains(regionCode)
		let size = isAnsi ? PaperSize.letter : PaperSize.a4
		return size
	}

}
