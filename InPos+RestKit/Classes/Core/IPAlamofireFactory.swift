//
//  IPAlamofireFactory.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/19/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

open class IPAlamofireFactory: IPCommandFactory {

	// MARK: -
	// MARK: Properties

	open private(set) var supportedCommandTypes: [Int]!

	// MARK: -
	// MARK: Convenience methods

	open override class func factoryBuilder() -> IPIFactoryBuilder.Type? {
		return IPAlamofireFactoryBuilder.self
	}

}
