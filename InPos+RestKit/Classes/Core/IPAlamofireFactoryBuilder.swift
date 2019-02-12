//
//  IPAlamofireFactoryBuilder.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/19/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation

open class IPAlamofireFactoryBuilder: IPIFactoryBuilder {

	// MARK: -
	// MARK: Properties

	open var baseURL: URL?

	// MARK: -
	// MARK: Initialization

	public required init(buildClosure: BuilderClosure) {
		buildClosure(self)
	}
}
