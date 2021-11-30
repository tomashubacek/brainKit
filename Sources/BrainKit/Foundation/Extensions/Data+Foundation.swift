//
//  Data+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Data {
	public var string: String? {
		String(data: self, encoding: .utf8)
	}
}
