//
//  OrderableManagedObject.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData
import Foundation

public protocol OrderableManagedObject: NSManagedObject {
	var ord: Int32 { get }
}


