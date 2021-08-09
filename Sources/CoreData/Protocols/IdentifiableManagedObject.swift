//
//  IdentifiableManagedObject.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData

public protocol IdentifiedManagedObject: NSManagedObject {
	var id: Int64 { get }
}
