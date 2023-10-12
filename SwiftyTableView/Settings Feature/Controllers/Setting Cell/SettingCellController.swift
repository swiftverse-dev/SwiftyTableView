//
//  SettingCellController.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

final class SettingCellController: BaseCellDataSource<SettingTableViewCell> {
    
    private let model: SettingCellModel
    
    init(model: SettingCellModel) {
        self.model = model
    }
    
    override func configure(cell: SettingTableViewCell) {
        cell.iconView.image = UIImage(systemName: model.imageName)
        cell.primaryLabel.text = model.primaryLabel
        cell.secondaryLabel.text = model.secondaryLabel
        cell.imageContainer.backgroundColor = model.color
    }
}
