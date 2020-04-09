//
//  StoryboardInstantiable.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 09. 04. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

// based on https://github.com/Peterek/storyboard-instantiable

public protocol StoryboardInstantiable where Self: UIViewController {
	static var storyboardName: String { get }
	static var controllerIdentifier: String { get }

	static func instantiateFromStoryboard(from bundle: Bundle) -> Self
}

extension StoryboardInstantiable {
	public static var storyboardName: String {
		String(describing: self)
	}

	public static var controllerIdentifier: String {
		String(describing: self)
	}

	public static func instantiateFromStoryboard(from bundle: Bundle = Bundle.main) -> Self {
		// following can raise exceptions, but are not throwing
		let storyboard = UIStoryboard(name: self.storyboardName, bundle: bundle)
		let vc = storyboard.instantiateViewController(withIdentifier: self.controllerIdentifier) as! Self
		return vc
	}
}
