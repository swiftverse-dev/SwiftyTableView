//
//  ListElementController.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

struct ListElementController{
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?
    let cellRegistrations: [CellRegistration]
    
    init(dataSource: UITableViewDataSource, delegate: UITableViewDelegate? = nil, dataSourcePrefetching: UITableViewDataSourcePrefetching? = nil) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.dataSourcePrefetching = dataSourcePrefetching
        self.cellRegistrations = []
    }
    
}

extension ListElementController {
    
    init(
        registrableDataSource: UITableViewDataSource & CellRegistration,
        delegate: UITableViewDelegate? = nil,
        dataSourcePrefetching: UITableViewDataSourcePrefetching? = nil
    ) {
        self.dataSource = registrableDataSource
        self.delegate = delegate
        self.dataSourcePrefetching = dataSourcePrefetching
        self.cellRegistrations = [registrableDataSource]
    }
    
    init(sectionDataSource: BaseSectionDataSource, delegate: UITableViewDelegate? = nil, dataSourcePrefetching: UITableViewDataSourcePrefetching? = nil) {
        self.dataSource = sectionDataSource
        self.delegate = delegate
        self.dataSourcePrefetching = dataSourcePrefetching
        self.cellRegistrations = sectionDataSource.cellRegistrations
    }
    
}
