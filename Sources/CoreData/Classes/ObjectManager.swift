//
//  ObjectManager.swift
//  iOS
//
//  Created by Ondřej Hanák on 08. 04. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import CoreData
import Foundation
import SwiftyJSON

/// Base class for object managers.
open class ObjectManager<T> where T: NSManagedObject {
	public var context: NSManagedObjectContext

	public var entityName: String {
		T.entity().name!
	}

	public init(context: NSManagedObjectContext) {
		self.context = context
	}

	public func makeFetchRequest() -> NSFetchRequest<T> {
		NSFetchRequest<T>(entityName: self.entityName)
	}

	public func fetch(predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]? = nil, limit: Int? = nil) -> [T] {
		let request = self.makeFetchRequest()
		let predicate = predicate
		request.predicate = predicate
		request.sortDescriptors = sortDescriptors
		if let limit = limit {
			request.fetchLimit = limit
		}
		let result = try? self.context.performAndWait {
			try request.execute()
		}
		return result ?? []
	}

	public func insert() -> T {
		T(context: self.context)
	}
}

extension ObjectManager where T: IdentifiedManagedObject {
	public func find(withID id: Int64) -> T? {
		let predicate = NSPredicate(format: "id == %d", id)
		return self.fetch(predicate: predicate, limit: 1).first
	}

	public func find(withIDs ids: [Int64]) -> [T] {
		let predicate = NSPredicate(format: "id IN %@", ids)
		let result = self.fetch(predicate: predicate)
		return result
	}

	public func findOrInsert(withID id: Int64) -> T {
		self.find(withID: id) ?? self.insert()
	}

	public func findInOrder(withIDs ids: [Int64]) -> [T] {
		let objects = self.find(withIDs: ids)
		let orderMap: [Int64: Int] = ids.reduce(into: [:]) { $0[$1] = $0.count } // map[id] = expected_order
		let result = objects.sorted { orderMap[$0.id]! < orderMap[$1.id]! }
		return result
	}

	public func delete(withID id: Int64) {
		if let object = self.find(withID: id) {
			object.delete()
		}
	}
}
