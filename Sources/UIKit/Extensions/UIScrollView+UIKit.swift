//
//  UIScrollView+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 06. 08. 2020.
//  Copyright © 2020 Userbrain. All rights reserved.
//

import UIKit

extension UIScrollView {
	public var currentPage: Int {
		Int(round(self.contentOffset.x / self.frame.width))
	}

	public var pagesCount: Int {
		Int(round(self.contentSize.width / self.frame.width))
	}

	public func scrollToPage(_ page: Int, animated: Bool) {
		var frame = self.frame
		frame.origin.x = frame.size.width * CGFloat(page)
		frame.origin.y = 0;
		self.scrollRectToVisible(frame, animated: animated)
	}
}
