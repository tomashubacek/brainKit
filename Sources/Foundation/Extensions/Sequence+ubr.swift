//
//  Sequence+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 03. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
	public func unique() -> [Iterator.Element] {
		// based on https://twitter.com/iamprashant_k_t/status/1235189361127419904
		var seen: Set<Iterator.Element> = []
		return filter { seen.insert($0).inserted }
	}
}
