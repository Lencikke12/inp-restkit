//
//  IPICommandFactoryBuilder.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/18/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation

public typealias BuilderClosure = (IPIFactoryBuilder) -> ()

public protocol IPIFactoryBuilder: class {

	// MARK: -
	// MARK: Properties

	var baseURL: URL? { get set }

	// MARK: -
	// MARK: Initialization

	init(buildClosure: BuilderClosure)
}
