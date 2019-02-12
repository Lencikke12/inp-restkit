//
//  IPCommandFactory.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation

open class IPCommandFactory: IPICommandFactory {

	// MARK: -
	// MARK: Properties

	open var baseURL: URL?

	// MARK: -
	// MARK: Initialization

	public required init(factoryBuilder: IPIFactoryBuilder) {
		if let URL = factoryBuilder.baseURL {
			baseURL = URL
		}
	}

	// MARK: -
	// MARK: IPICommandFactory methods

	open class func factoryBuilder() -> IPIFactoryBuilder.Type? {
		return nil
	}

	open func commandClass(_ type: Int) -> IPICommand.Type? {
		return nil
	}

	open func command(_ type: Int, baseURL: URL) -> IPICommand? {
		return self.commandClass(type)?.init()
	}
}
