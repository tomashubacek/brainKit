//
//  UIImage+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

// based on https://stackoverflow.com/a/58981946/1548913
extension UIImage {
	private enum BlendMode {
		case multiply // This results in colors that are at least as dark as either of the two contributing sample colors
		case screen // This results in colors that are at least as light as either of the two contributing sample colors
	}

	// A level of zero yeilds the original image, a level of 1 results in black
	public func darken(level: CGFloat = 0.5) -> UIImage? {
		return blend(mode: .multiply, level: level)
	}

	// A level of zero yeilds the original image, a level of 1 results in white
	public func lighten(level: CGFloat = 0.5) -> UIImage? {
		return blend(mode: .screen, level: level)
	}

	private func blend(mode: BlendMode, level: CGFloat) -> UIImage? {
		let context = CIContext(options: nil)
		var level = max(0, min(level, 1)) // Ensure <0;1> closed interval
		let filterName: String
		switch mode {
		case .multiply:
			level = abs(level - 1.0)
			filterName = "CIMultiplyBlendMode"
			case .screen:
			filterName = "CIScreenBlendMode"
		}

		let blender = CIFilter(name: filterName)!
		let backgroundColor = CIColor(color: UIColor(white: level, alpha: 1))

		guard let inputImage = CIImage(image: self) else { return nil }
		blender.setValue(inputImage, forKey: kCIInputImageKey)

		guard let backgroundImageGenerator = CIFilter(name: "CIConstantColorGenerator") else { return nil }
		backgroundImageGenerator.setValue(backgroundColor, forKey: kCIInputColorKey)
		guard let backgroundImage = backgroundImageGenerator.outputImage?.cropped(to: CGRect(origin: CGPoint.zero, size: self.size)) else { return nil }
		blender.setValue(backgroundImage, forKey: kCIInputBackgroundImageKey)

		guard let blendedImage = blender.outputImage else { return nil }

		guard let cgImage = context.createCGImage(blendedImage, from: blendedImage.extent) else { return nil }
		return UIImage(cgImage: cgImage)
	}
}


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

	public func squareCrop() -> UIImage {
		let outEdge = min(self.size.width, self.size.height)
		let dx = round((self.size.width - outEdge) / 2)
		let dy = round((self.size.height - outEdge) / 2)
		let squareSize = CGSize(width: outEdge, height: outEdge)
		let renderFormat = UIGraphicsImageRendererFormat()
		renderFormat.scale = 1
		renderFormat.opaque = false
		let renderer = UIGraphicsImageRenderer(size: squareSize, format: renderFormat)
		let squareImage = renderer.image { [weak self] _ in
			self?.draw(at: CGPoint(x: -dx, y: -dy))
		}
		return squareImage
	}

	public func squareCrop(edge: CGFloat, upscale: Bool) -> UIImage {
		let smallerInputEdge = min(self.size.width, self.size.height)
		var ratio = edge / smallerInputEdge
		if (upscale == false) {
			ratio = min(1, ratio)
		}
		let newWidth = round(self.size.width * ratio)
		let newHeight = round(self.size.height * ratio)
		let newSize = CGSize(width: newWidth, height: newHeight)
		let resized = self.resized(toFit: newSize, upscale: upscale)
		let square = resized.squareCrop()
		return square
	}
}
