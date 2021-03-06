//
//  TestableFatals.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 21. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

// based on https://stackoverflow.com/a/44140448/1548913

import Foundation

// overrides Swift global `fatalError`
public func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
	FatalErrorUtil.fatalErrorClosure(message(), file, line)
	unreachable()
}

/// This is a `noreturn` function that pauses forever
public func unreachable() -> Never {
	repeat {
		RunLoop.current.run()
	} while (true)
}

/// Utility functions that can replace and restore the `fatalError` global function.
public struct FatalErrorUtil {

	// Called by the custom implementation of `fatalError`.
	static var fatalErrorClosure: (String, StaticString, UInt) -> Never = defaultFatalErrorClosure

	// backup of the original Swift `fatalError`
	private static let defaultFatalErrorClosure = { Swift.fatalError($0, file: $1, line: $2) }

	/// Replace the `fatalError` global function with something else.
	public static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Never) {
		fatalErrorClosure = closure
	}

	/// Restore the `fatalError` global function back to the original Swift implementation
	public static func restoreFatalError() {
		fatalErrorClosure = defaultFatalErrorClosure
	}
}
