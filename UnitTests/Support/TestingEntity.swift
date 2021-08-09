//
//  TestingEntity.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 08. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData
import BrainKit
import SwiftyJSON

@objc(TestingEntity)
class TestingEntity: NSManagedObject {
	@NSManaged var id: Int64
	@NSManaged var ord: Int32
}

extension TestingEntity: OrderableManagedObject {}

extension TestingEntity: IdentifiedManagedObject {}

extension TestingEntity: JSONUpdatable {
	func update(from json: JSON) {
		self.id = json["id"].int64Value
	}
}
