//
//  IPWebService.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import UIKit

private enum StaticStrings: String {
	case plistName = "IPProjectSettings"
	case baseUrlsKey = "IPBaseUrlsKey"
}

open class IPWebService<FactoryType>: NSObject where FactoryType: IPAbstractFactory {

	// MARK: -
	// MARK: Properties

	open private(set) var factory: FactoryType
	private lazy var plistHandler: IPPlistHandler! = {
		return IPPlistHandler(withName: StaticStrings.plistName.rawValue)
	}()

	// MARK: -
	// MARK: Initialization

	public init(withFactory factory: FactoryType) {
		self.factory = factory

		super.init()
	}

	// MARK: -
	// MARK: Getters and setters

	open var baseURL: URL! {
		get {
			return URL(string: baseURLString)
		}
	}

	open var baseURLString: String! {
		get {
			// Load current build configuration
			guard let buildConfiguration = String.buildConfiguration() else {
				return nil
			}

			// Get base URL string
			guard let baseURLString: String = plistHandler.object(forKeys: [StaticStrings.baseUrlsKey.rawValue, buildConfiguration]) else {
				print("[InPos][Error] Cannot load URL string from Plist")
				return nil
			}

			return baseURLString
		}
	}
}
