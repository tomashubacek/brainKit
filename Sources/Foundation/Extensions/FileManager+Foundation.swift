//
//  FileManager+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension FileManager {
	public func sizeOfFile(at url: URL) throws -> UInt64 {
		let attr = try self.attributesOfItem(atPath: url.path)
		let size = attr[FileAttributeKey.size] as? UInt64 ?? 0
		return size
	}
}
