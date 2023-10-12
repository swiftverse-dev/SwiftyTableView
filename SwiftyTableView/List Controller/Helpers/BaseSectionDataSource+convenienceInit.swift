//
//  SectionController+convenienceInit.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import Foundation

extension BaseSectionDataSource {
    convenience init(@CellBuilder _ cellControllers: () -> [CellController]) {
        self.init(cellControllers: cellControllers())
    }
}
