//
//  Result.swift
//  CuritiBus
//
//  Created by Cosmin Stirbu on 2/23/17.
//  https://github.com/antitypical/Result
//  MIT License
//
//  Copyright (c) 2017 Fortech
//

import Foundation

enum Result<T> {
	case success(T)
	case failure(Error)
	
	public func dematerialize() throws -> T {
		switch self {
		case let .success(value):
			return value
		case let .failure(error):
			throw error
		}
	}
}
