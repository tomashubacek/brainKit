//
//  UIColor+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 22. 02. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIColor {
	public func image(size: CGSize) -> UIImage {
		UIGraphicsImageRenderer(size: size).image { rendererContext in
			self.setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
