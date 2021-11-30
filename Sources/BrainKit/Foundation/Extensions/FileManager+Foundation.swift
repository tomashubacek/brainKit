//
//  FileManager+Foundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension FileManager {
	public func sizeOfFile(at url: URL) -> UInt64 {
		let attr = try? self.attributesOfItem(atPath: url.path)
		let size = attr?[FileAttributeKey.size] as? UInt64 ?? 0
		return size
	}

	public func formattedSizeOfFile(at url: URL) -> String {
		let diskSize = Int64(self.sizeOfFile(at: url))
		let formatedSize = ByteCountFormatter.string(fromByteCount: diskSize, countStyle: .decimal)
		return formatedSize
	}

	public func documentsDirectory() -> URL {
		let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
		let documentsDirectory = paths[0]
		return documentsDirectory
	}

	public func temporaryDirectory() -> URL {
		return URL(fileURLWithPath: NSTemporaryDirectory())
	}
}
