//
//  XCTestCase+ext.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 08. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import XCTest

extension XCTestCase {
	var testBundle: Bundle {
		Bundle(for: type(of: self))
	}
}
