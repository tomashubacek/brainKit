//
//  UIImage+AVFoundation.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 04. 05. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import AVFoundation
import UIKit

extension UIImage {
	public static func makeFromVideo(url: URL, at time: Double = 0) throws -> UIImage {
		let asset = AVURLAsset(url: url)
		let generator = AVAssetImageGenerator(asset: asset)
		generator.appliesPreferredTrackTransform = true
		let timestamp = CMTime(seconds: time, preferredTimescale: 60)
		let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
		let image = UIImage(cgImage: imageRef)
		return image
	}
}
