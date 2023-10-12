//
//  UITableView+Dequeue.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

extension UITableView{
    func dequeueCell<T: UITableViewCell>(at index: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.cellId, for: index) as! T
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        dequeueReusableHeaderFooterView(withIdentifier: T.viewId) as! T
    }
}
