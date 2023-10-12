//
//  BaseCellDataSource.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

class BaseCellDataSource<Cell: UITableViewCell>: NSObject, UITableViewDataSource{
    
    weak var cell: Cell?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueCell(at: indexPath)
        self.cell = cell
        configure(cell: cell)
        return cell
    }
    
    func configure(cell: Cell) {}
}

extension BaseCellDataSource: CellRegistration {
    static var useNib: Bool { true }
    static var hash: Int { String(describing: Cell.self).hash }
    static func register(in tableView: UITableView) {
        Cell.register(in: tableView, usingNib: useNib)
    }
}
