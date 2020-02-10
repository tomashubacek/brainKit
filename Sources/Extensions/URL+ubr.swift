//
//  URL+ubr.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 10. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import Foundation

extension URL {
	public func appendingParam(name: String, value: String?) -> URL {
		// based on https://stackoverflow.com/a/50990443/1548913
		guard var urlComponents = URLComponents(string: self.absoluteString) else { return self.absoluteURL }
		var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
		let paramItem = URLQueryItem(name: name, value: value)
		queryItems.append(paramItem)
		urlComponents.queryItems = queryItems
		return urlComponents.url ?? self
	}

	public init(staticString: StaticString) {
		guard let url = URL(string: "\(staticString)") else {
			preconditionFailure("Invalid static URL string: \(staticString)")
		}
		self = url
	}
}
