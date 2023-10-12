//
//  ToggleCellController.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import Foundation

import UIKit

final class ToggleCellController: BaseCellDataSource<ToggleTableViewCell> {
    
    private let model: SettingCellModel
    
    init(model: SettingCellModel) {
        self.model = model
    }
    
    override func configure(cell: ToggleTableViewCell) {
        cell.iconView.image = UIImage(systemName: model.imageName)
        cell.label.text = model.primaryLabel
        cell.imageContainer.backgroundColor = model.color
    }
}
