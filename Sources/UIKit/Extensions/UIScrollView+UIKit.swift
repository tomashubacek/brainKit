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
		let width = self.frame.width
		guard width > 0 else { return 0 }
		return Int(round(self.contentOffset.x / width))
	}

	public var pagesCount: Int {
		let width = self.frame.width
		guard width > 0 else { return 0 }
		return Int(round(self.contentSize.width / width))
	}

	public func scrollToPage(_ page: Int, animated: Bool) {
		var frame = self.frame
		frame.origin.x = frame.size.width * CGFloat(page)
		frame.origin.y = 0;
		self.scrollRectToVisible(frame, animated: animated)
	}
}
