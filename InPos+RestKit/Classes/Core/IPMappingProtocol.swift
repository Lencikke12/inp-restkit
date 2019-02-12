//
//  IPMappingProtocol.swift
//  Inpos
//
//  Created by Hunor Andras on 01/11/2018.
//  Copyright © 2018 Hunor Andras. All rights reserved.
//

import Foundation
import RestKit

public protocol IPMappingProtocol: class {
    
    // MARK: -
    // MARK: Convenience methods
    
    static var entityName: String { get }
    static func objectMapping(_ type: Int) -> RKObjectMapping!
    static func entityMapping(_ type: Int) -> RKEntityMapping!
}
