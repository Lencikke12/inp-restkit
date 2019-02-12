//
//  IPError.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Foundation
import RestKit

open class IPError: NSObject {

	// MARK: -
	// MARK: Properties

	open var code: NSNumber!
	open var message: String!

	// MARK: -
	// MARK: Initialization

	public override convenience init() {
		self.init("")
	}

	public init(_ errorString: String) {
		super.init()

		message = errorString
	}

	// MARK: -
	// MARK: Convenience methods

	open class func from(_ error: NSError?) -> IPError {
		guard let anError = error, let errors = anError.userInfo[RKObjectMapperErrorObjectsKey] as? [IPError] else {
			return IPError(error?.localizedDescription ?? "")
		}

		if errors.count == 0 {
			return IPError("Unknown error")
		}

		return errors[0]
	}

	// MARK: -
	// MARK: Overridden methods

	open override var description: String {
		get {
			guard let description = message else {
				return ""
			}
			return description
		}
	}
}
