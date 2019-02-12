//
//  IPPersistentRestKitFactoryBuilder.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/18/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import UIKit

open class IPPersistentRestKitFactoryBuilder<ModelController>: IPRestKitFactoryBuilder where ModelController: IPModelController {

	// MARK: -
	// MARK: Properties

	open var modelController: ModelController!
}
