//
//  IPIAlamofireCommand.swift
//  InPos+RestKit
//
//  Created by Zsolt Balint on 12/19/16.
//  Copyright © 2016 InPos Soft. All rights reserved.
//

import Alamofire

public typealias AlamofireCommandCompletion = (AnyObject?) -> Void
public typealias AlamofireCommandProgress = (Progress) -> Void
public typealias AlamofireCommandFail = (IPError) -> Void

public protocol IPIAlamofireCommand: IPICommand {

	// MARK: -
	// MARK: Public methods

	func execute(object: AnyObject, completion: @escaping AlamofireCommandCompletion, progress: @escaping AlamofireCommandProgress, fail: @escaping AlamofireCommandFail)
}
