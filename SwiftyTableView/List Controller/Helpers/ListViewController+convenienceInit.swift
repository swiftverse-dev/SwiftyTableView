//
//  ListViewController+convenienceInit.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

extension ListViewController {
    
    convenience init(cellControllers: [CellController], style: UITableView.Style = .plain) {
        self.init(style: style)
        self.sectionControllers = [SectionController(sectionDataSource: BaseSectionDataSource(cellControllers: cellControllers))]
    }
    
    convenience init(sectionController: [SectionController], style: UITableView.Style = .plain) {
        self.init(style: style)
        self.sectionControllers = sectionController
    }
    
    convenience init(style: UITableView.Style = .plain, @SectionBuilder _ sections: () -> [SectionController]) {
        self.init(style: style)
        let sectionControllers = sections()
        
        self.sectionControllers = sectionControllers
        let cellRegistrations = sectionControllers.flatMap(\.cellRegistrations)
        var registrationSet = Set<Int>()
        
        let filteredRegistrations = cellRegistrations.filter{
            let type = type(of: $0)
            let containsHash = registrationSet.contains(type.hash)
            if containsHash { return false }
            registrationSet.insert(type.hash)
            return true
        }
        
        registerCells(filteredRegistrations)
    }
}
