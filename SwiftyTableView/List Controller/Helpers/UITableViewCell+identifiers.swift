//
//  UITableViewCell+identifiers.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

extension UITableViewCell{
    static var cellId: String{ String(describing: Self.self) }
    static func register(in tableView: UITableView, usingNib: Bool = true){
        if !usingNib {
            return tableView.register(Self.self, forCellReuseIdentifier: cellId)
        }
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: cellId, bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
}

extension UITableViewHeaderFooterView {
    static var viewId: String{ String(describing: Self.self) }
    static func register(in tableView: UITableView, usingNib: Bool = true){
        if !usingNib {
            return tableView.register(Self.self, forHeaderFooterViewReuseIdentifier: viewId)
        }
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: viewId, bundle: bundle)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: viewId)
    }
}
