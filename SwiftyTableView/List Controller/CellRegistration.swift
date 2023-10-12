//
//  CellRegistration.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

protocol CellRegistration {
    static var hash: Int { get }
    static func register(in tableView: UITableView)
}
