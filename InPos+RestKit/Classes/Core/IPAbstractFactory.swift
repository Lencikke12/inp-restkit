//
//  IPAbstractFactory.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation

open class IPAbstractFactory: IPIAbstractFactory {

	// MARK: -
	// MARK: Properties

	private var factories = [Int: IPICommandFactory]()
	open private(set) var supportedCommandTypes: [Int]!
	open var baseURL: URL?

	// MARK: -
	// MARK: Initialization

	public init() {
	}

	// MARK: -
	// MARK: Public methods

	open func builderFor(builderClass: IPIFactoryBuilder.Type) -> IPIFactoryBuilder {
		return builderClass.init(buildClosure: { (builder) in
			builder.baseURL = baseURL
		})
	}

	// MARK: -
	// MARK: IPIAbstractFactory methods

	open func factoryClass(_ type: Int) -> IPICommandFactory.Type? {
		return nil
	}

	open func factory(_ type: Int, baseURL: URL) -> IPICommandFactory? {
		if factories[type] == nil {
			self.baseURL = baseURL

			guard let factoryClass = self.factoryClass(type) else {
				return nil
			}

			guard let factoryBuilderClass = factoryClass.factoryBuilder() else {
				return nil
			}

			let factoryBuilder = builderFor(builderClass: factoryBuilderClass)
			factories[type] = factoryClass.init(factoryBuilder: factoryBuilder)
		}
		return factories[type]
	}
}
