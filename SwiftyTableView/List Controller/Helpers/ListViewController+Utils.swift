//
//  ListViewController+Utils.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

extension ListViewController {
    func navigationTitle(_ title: String, largeTitle: UINavigationItem.LargeTitleDisplayMode = .always) -> Self {
        self.title = title
        self.largeTitle = largeTitle
        return self
    }
    
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Self {
        self.tableView.separatorStyle = style
        return self
    }
    
    func separatorInset(_ inset: UIEdgeInsets) -> Self {
        self.tableView.separatorInset = inset
        return self
    }
}
