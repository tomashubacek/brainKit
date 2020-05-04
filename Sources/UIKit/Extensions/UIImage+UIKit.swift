//
//  UIImage+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIImage {
	/// Also upscales if given size is greater then the actual one.
	public func resized(toFit newSize: CGSize) -> UIImage {
		// original metrics
		let outWidth = newSize.width
		let outHeight = newSize.height
		let originalWidth = self.size.width
		let originalHeight = self.size.height
		let widthRatio = outWidth / originalWidth
		let heightRatio = outHeight / originalHeight

		// new metrics
		let ratio = min(widthRatio, heightRatio)
		let newWidth = ratio * originalWidth
		let newHeight = ratio * originalHeight
		let newSize = CGSize(width: newWidth, height: newHeight)

		// render
		let renderFormat = UIGraphicsImageRendererFormat.default()
		renderFormat.opaque = false
		let renderer = UIGraphicsImageRenderer(size: newSize, format: renderFormat)
		let newImage = renderer.image { [weak self] _ in
			self?.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
		}
		return newImage
	}
}
