//
//  SettingCellModel.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

struct SettingCellModel {
    let imageName: String
    let primaryLabel: String
    let secondaryLabel: String?
    let color: UIColor
    
    init(imageName: String, primaryLabel: String, secondaryLabel: String? = nil, color: UIColor) {
        self.imageName = imageName
        self.primaryLabel = primaryLabel
        self.secondaryLabel = secondaryLabel
        self.color = color
    }
}
