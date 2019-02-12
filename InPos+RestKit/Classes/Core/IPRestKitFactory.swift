//
//  IPRestKitFactory.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import RestKit

open class IPRestKitFactory: IPCommandFactory {
    
    // MARK: -
    // MARK: Properties
    
    open private(set) var supportedCommandTypes: [Int]!
    
    // MARK: -
    // MARK: Initialization
    
    public required init(factoryBuilder: IPIFactoryBuilder) {
        super.init(factoryBuilder: factoryBuilder)
        
        // Create object manager
        RKObjectManager.setShared(RKObjectManager(baseURL: baseURL))
        
        RKObjectManager.shared().setAcceptHeaderWithMIMEType(RKMIMETypeJSON)
        RKObjectManager.shared().requestSerializationMIMEType = RKMIMETypeJSON
        
        initializationBeforeMapping()
        
        self.setMappings()
    }
    
    // MARK: -
    // MARK: Convenience methods
    
    open override class func factoryBuilder() -> IPIFactoryBuilder.Type? {
        return IPRestKitFactoryBuilder.self
    }
    
    // MARK: -
    // MARK: Public methods
    
    open func initializationBeforeMapping() {
    }
    
    open func errorResponseDescriptor() -> RKResponseDescriptor? {
        
        // Override this method to provide errorMapping
        return nil
    }
    
    // MARK: -
    // MARK: Private methods
    
    private func setMappings() {
        // Do command mappings
        for commandType in self.supportedCommandTypes {
            if let command = self.commandClass(commandType) as? IPIRestKitCommand.Type {
                if let route = command.route() {
                    RKObjectManager.shared().router.routeSet.add(route)
                }
                
                if let requestDescriptor = command.requestDescriptor() {
                    RKObjectManager.shared().addRequestDescriptor(requestDescriptor)
                }
                
                if let responseDescriptors = command.responseDescriptors() {
                    RKObjectManager.shared().addResponseDescriptors(from: responseDescriptors)
                }
            }
        }
        
        guard let errorResponseDescriptor = self.errorResponseDescriptor() else {
            return
        }
        
        // Do the error mapping
        RKObjectManager.shared().addResponseDescriptor(errorResponseDescriptor)
    }
}
