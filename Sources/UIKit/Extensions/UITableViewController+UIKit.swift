//
//  UITableViewController+UIKit.swift
//  BrainKit
//
//  Created by Ondřej Hanák on 19. 05. 2021.
//  Copyright © 2021 Userbrain. All rights reserved.
//

import UIKit

extension UITableViewController {
	public func deselectRowWhenInCollapsedSplit() {
		guard self.splitViewController?.isCollapsed == true else { return }
		guard let selection = self.tableView.indexPathForSelectedRow else { return }
		self.tableView.deselectRow(at: selection, animated: true)
	}
}
