//
//  IPMappingFactory.swift
//  Inpos
//
//  Created by Hunor Andras on 01/11/2018.
//  Copyright © 2018 Hunor Andras. All rights reserved.
//

import Foundation
import RestKit

public protocol IPMappingFactoryProtocol: class {
    
    // MARK: -
    // MARK: Convenience methods
    
    static func mappingClass(_ mappingType: Int) -> IPMappingProtocol.Type?
}

open class IPMappingFactory: IPMappingFactoryProtocol {
    
    // MARK: -
    // MARK: Convenience methods
    
    open class func mappingClass(_ mappingType: Int) -> IPMappingProtocol.Type? {
        return nil
    }
    
    public static func objectMapping(for mappingType: Int, type: Int) -> RKObjectMapping! {
        return self.mappingClass(mappingType)?.objectMapping(type)
    }
    
    public static func entityMapping(for mappingType: Int, type: Int) -> RKEntityMapping! {
        return self.mappingClass(mappingType)?.entityMapping(type)
    }
    
}
