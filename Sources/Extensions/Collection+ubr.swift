//
//  Collection+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 20. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Collection {
	public subscript(safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}
