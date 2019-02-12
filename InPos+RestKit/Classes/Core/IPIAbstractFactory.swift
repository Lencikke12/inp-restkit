//
//  IPIAbstractFactory.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import UIKit

public protocol IPIAbstractFactory {

	// MARK: -
	// MARK: Public methods

	func factoryClass(_ type: Int) -> IPICommandFactory.Type?
	func factory(_ type: Int, baseURL: URL) -> IPICommandFactory?
}
