//
//  SettingsListPreview.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//

import SwiftUI

@available(iOS 17, *)
#Preview{
    let listVC = ListViewController {
        UserCellController()
        
        SettingSectionController(title: "Network") {
            ToggleCellController(model: .flyMode)
            SettingCellController(model: .wifi)
            SettingCellController(model: .cloud)
        }
        
        SettingSectionController(title: "Others") {
            SettingCellController(model: .notifications)
            SettingCellController(model: .general)
        }
    }
    .navigationTitle("Settings")
    
    return UINavigationController(rootViewController: listVC)
}
