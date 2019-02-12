//
//  IPPersistentWebService.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/18/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation
import RestKit

open class IPPersistentRestKitFactory: IPRestKitFactory {

	// MARK: -
	// MARK: Properties

	private var modelController: IPModelController!

	// MARK: -
	// MARK: Initialization

	public required init(factoryBuilder: IPIFactoryBuilder) {
		if let modelController = (factoryBuilder as? IPPersistentRestKitFactoryBuilder)?.modelController {
			self.modelController = modelController
		}

		super.init(factoryBuilder: factoryBuilder)
	}

	// MARK: -
	// MARK: Convenience methods

	open override class func factoryBuilder() -> IPIFactoryBuilder.Type? {
		return IPPersistentRestKitFactoryBuilder.self
	}

	// MARK: -
	// MARK: Overridden methods

	open override func initializationBeforeMapping() {
		let managedObjectStore = RKManagedObjectStore(persistentStoreCoordinator: modelController.coreDataController.persistentStoreCoordinator)
		managedObjectStore?.createManagedObjectContexts()

		RKManagedObjectStore.setDefault(managedObjectStore)
		RKObjectManager.shared().managedObjectStore = RKManagedObjectStore.default()
	}
    
    open override func errorResponseDescriptor() -> RKResponseDescriptor? {
        
        // Override this method to provide errorMapping
        return nil
    }
}
