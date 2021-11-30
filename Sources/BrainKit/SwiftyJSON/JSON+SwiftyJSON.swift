//
//  JSON+SwiftyJSON.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 20. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
	public var uuid: UUID? {
		get {
			UUID(uuidString: self.stringValue)
		}
		set {
			self.string = newValue?.uuidString
		}
	}
}
