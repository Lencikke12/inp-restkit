//
//  IPICommandFactory.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import UIKit

public protocol IPICommandFactory: class {

	// MARK: -
	// MARK: Initialization

	init(factoryBuilder: IPIFactoryBuilder)

	// MARK: -
	// MARK: Convenience methods

	static func factoryBuilder() -> IPIFactoryBuilder.Type?

	// MARK: -
	// MARK: Public methods

	func commandClass(_ type: Int) -> IPICommand.Type?
	func command(_ type: Int, baseURL: URL) -> IPICommand?
}
