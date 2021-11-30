//
//  Reusable.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 22.11.2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation

public protocol Reusable {}

extension Reusable {
	/// Reuse identifier - class name.
	public static var reuseIdentifier: String {
		return NSStringFromClass(self as! AnyObject.Type)
	}
}
