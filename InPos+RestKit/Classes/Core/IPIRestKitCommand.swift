//
//  IPIRestKitCommand.swift
//  InPos+RestKit
//
//  Created by Márton-Attila Simó on 15/12/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import RestKit

public typealias CommandCompletion = (_: RKMappingResult?) -> Void
public typealias CommandFail = (_: IPError) -> Void

public protocol IPIRestKitCommand: IPICommand {

	// MARK: -
	// MARK: Convenience methods

	static func route() -> RKRoute!
	static func requestDescriptor() -> RKRequestDescriptor!
	static func responseDescriptors() -> [RKResponseDescriptor]!
	// MARK: -
	// MARK: Public methods

	func execute(object: AnyObject?, completion: @escaping CommandCompletion, fail: @escaping CommandFail)
}
