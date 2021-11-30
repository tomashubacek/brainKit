//
//  Set+CoreData.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09. 08. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData

extension Set where Element: OrderableManagedObject {
	public func inOrder(ascending: Bool) -> [Element] {
		let comparator: (Element, Element) -> Bool = ascending ? { $0.ord < $1.ord } : { $0.ord > $1.ord }
		return self.sorted(by: comparator)
	}
}

extension Set where Element: NSManagedObject {
	public func deleteAll() {
		self.forEach { $0.delete() }
	}
}
