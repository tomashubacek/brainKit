//
//  Bundle+SwiftyJSON.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 27. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import SwiftyJSON

extension Bundle {
	public  func loadJSONFromFile(_ name: String) -> JSON? {
		guard let data = self.loadDataFromFile(name) else { return nil }
		let json = JSON(data)
		guard json != .null else { return nil }
		return json
	}
}
