//
//  JSONUpdatable.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import SwiftyJSON

public protocol JSONUpdatable {
	func update(from json: JSON)
}
