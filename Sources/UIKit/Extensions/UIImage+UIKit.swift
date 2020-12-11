//
//  UIImage+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIImage {
	public func resized(toFit newSize: CGSize, upscale: Bool) -> UIImage {
		// original metrics
		let outWidth = newSize.width
		let outHeight = newSize.height
		let originalWidth = self.size.width
		let originalHeight = self.size.height
		let widthRatio = outWidth / originalWidth
		let heightRatio = outHeight / originalHeight

		// new metrics
		var ratio = min(widthRatio, heightRatio)
		if (upscale == false) {
			ratio = min(1, ratio)
		}
		let newWidth = round(ratio * originalWidth)
		let newHeight = round(ratio * originalHeight)
		let newSize = CGSize(width: newWidth, height: newHeight)

		// render
		let renderFormat = UIGraphicsImageRendererFormat()
		renderFormat.scale = 1
		renderFormat.opaque = false
		let renderer = UIGraphicsImageRenderer(size: newSize, format: renderFormat)
		let newImage = renderer.image { [weak self] _ in
			self?.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
		}
		return newImage
	}
}
