//
//  BaseSectionDataSource.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

class BaseSectionDataSource: NSObject, UITableViewDataSource{
    
    let cellControllers: [ListElementController]
    let cellRegistrations: [CellRegistration]
    
    init(cellControllers: [ListElementController]) {
        self.cellControllers = cellControllers
        let cellRegistrations = cellControllers.flatMap(\.cellRegistrations)
        var registrationSet = Set<Int>()
        self.cellRegistrations = cellRegistrations.filter{
            let type = type(of: $0)
            let containsHash = registrationSet.contains(type.hash)
            if containsHash { return false }
            registrationSet.insert(type.hash)
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellController(at: indexPath).dataSource
            .tableView(tableView, cellForRowAt: indexPath)
    }
}

// MARK: HELPER
extension BaseSectionDataSource{
    func cellController(at index: IndexPath) -> ListElementController{
        cellControllers[index.row]
    }
}
