//
//  SettingSectionController.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

final class SettingSectionController: BaseSectionDataSource {
    
    private let title: String
    
    init(title: String, @CellBuilder cellControllers: () -> [CellController]) {
        self.title = title
        super.init(cellControllers: cellControllers())
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        title
    }
}

extension SettingSectionController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}
