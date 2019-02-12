//
//  IPFactoryBuilder.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/18/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation

open class IPRestKitFactoryBuilder: IPIFactoryBuilder {

	// MARK: -
	// MARK: Properties

	open var baseURL: URL?

	// MARK: -
	// MARK: Initialization

	public required init(buildClosure: BuilderClosure) {
		buildClosure(self)
	}
}
