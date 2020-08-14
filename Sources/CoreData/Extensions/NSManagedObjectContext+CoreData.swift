//
//  NSManagedObjectContext+CoreData.swift
//  UnitTests
//
//  Created by Ondřej Hanák on 27. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
	public func performAndWait<T>(_ block: () -> T) -> T {
		var result: T? = nil
		self.performAndWait {
			result = block()
		}
		return result!
	}

	public func performAndWait<T>(_ block: () throws -> T) throws -> T {
		var result: Result<T?, Error> = .success(nil)
		self.performAndWait {
			do {
				result = .success(try block())
			} catch {
				result = .failure(error)
			}
		}
		switch result {
		case let .success(value):
			return value!
		case let .failure(error):
			throw error
		}
	}

	public func saveIfNeeded() {
		guard self.hasChanges else { return }
		do {
			try self.save()
		} catch {
			fatalError("Error saving context: \(error.localizedDescription)")
		}
	}
}
