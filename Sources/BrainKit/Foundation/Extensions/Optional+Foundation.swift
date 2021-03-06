//
//  Optional+Foundation.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 29. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

// Ruby like conditional assignment	
infix operator ||= : AssignmentPrecedence
extension Optional {
	static func ||=(lhs: inout Optional, rhs: @autoclosure () -> Optional) {
		if lhs == nil {
			lhs = rhs()
		}
	}
}

extension Optional where Wrapped: Collection {
	public var isNilOrEmpty: Bool {
		self?.isEmpty ?? true
	}
}

extension Optional where Wrapped == String {
  public var nilIfEmpty: String? {
    if self?.isEmpty == true {
    	return nil
    }
    return self
  }
}

extension Optional {
	public var nullIfNil: Any {
		guard let value = self else { return NSNull() }
		return value
	}
}
