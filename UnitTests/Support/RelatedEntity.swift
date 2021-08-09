//
//  RelatedEntity.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData

@objc(RelatedEtity)
class RelatedEntity: NSManagedObject {
	@NSManaged var testing: TestingEntity?
}
