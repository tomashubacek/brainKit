//
//  NSManagedObject+CoreData.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData

extension NSManagedObject {
	public func delete() {
		self.managedObjectContext?.delete(self)
	}
}
