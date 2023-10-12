//
//  SectionBuilder.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

@resultBuilder
struct SectionBuilder {
    private typealias RegistrableDataSource = UITableViewDataSource & CellRegistration
    
    // MARK: BaseSectionDataSource
    static func buildBlock(_ dataSources: UITableViewDataSource...) -> [SectionController] {
        dataSources.map(makeSectionController(_:))
    }
}

private extension SectionBuilder {
    static func makeSectionController(_ dataSource: UITableViewDataSource) -> SectionController {
        
        let delegate = dataSource as? UITableViewDelegate
        let prefetch = dataSource as? UITableViewDataSourcePrefetching
        
        
        return if let cellRegistration = dataSource as? RegistrableDataSource {
            SectionController(
                registrableDataSource: cellRegistration,
                delegate: delegate,
                dataSourcePrefetching: prefetch
            )
        } else if let sectionDs = dataSource as? BaseSectionDataSource {
            SectionController(
                sectionDataSource: sectionDs,
                delegate: delegate,
                dataSourcePrefetching: prefetch
            )
        } else {
            SectionController(
                dataSource: dataSource,
                delegate: delegate,
                dataSourcePrefetching: prefetch
            )
        }
    }
}
