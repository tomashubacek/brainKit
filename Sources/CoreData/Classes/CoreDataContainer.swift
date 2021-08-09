//
//  CoreDataContainer.swift
//  TheDoctorsKitchen
//
//  Created by Ondřej Hanák on 28. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import CoreData
import Foundation

public final class CoreDataContainer {
	public enum StorageType {
		case persistent
		case inMemory
	}

	public static var sharedContainerName = "Default"
	public static let shared = CoreDataContainer(modelName: CoreDataContainer.sharedContainerName)
	public let persistenceContainer: NSPersistentContainer
	public var mainContext: NSManagedObjectContext {
		self.persistenceContainer.viewContext
	}

	// MARK: - Lifecycle

	public init(modelName: String, bundle: Bundle = Bundle.main, storageType: StorageType = .persistent) {
		guard let url = bundle.url(forResource: modelName, withExtension: "momd") else {
			fatalError("Model \(modelName) could not be found.")
		}
		guard let model = NSManagedObjectModel(contentsOf: url) else {
			fatalError("Model \(modelName) could not be loaded.")
		}
		self.persistenceContainer = NSPersistentContainer(name: modelName, managedObjectModel: model)
		if storageType == .inMemory {
			// `/dev/null` storage is preferred over NSInMemoryStoreType as it supports full SQLite backed storage feature set (like deletion cascading)
			let description = NSPersistentStoreDescription()
			description.url = URL(fileURLWithPath: "/dev/null")
			self.persistenceContainer.persistentStoreDescriptions = [description]
		}
		self.loadContainer()
	}

	// MARK: - Public

	public func newBackgroundContext() -> NSManagedObjectContext {
		let context = self.persistenceContainer.newBackgroundContext()
		context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		return context
	}

	// MARK: - Private

	private func loadContainer() {
		// executed synchronously until NSPersistentStoreDescription.shouldAddStoreAsynchronously set to true
		self.persistenceContainer.loadPersistentStores { storeDescription, error in
			if let error = error {
				fatalError("Persistent container error: \(error)")
			} else {
				self.persistenceContainer.viewContext.automaticallyMergesChangesFromParent = true
			}
		}
	}
}
