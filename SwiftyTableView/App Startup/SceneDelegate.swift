//
//  SceneDelegate.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let navController = UINavigationController(rootViewController: makeList())
//        navController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    private func makeList() -> UIViewController {
        ListViewController {
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
    }
    
    @ViewBuilder
    func foo() -> some View {
        List{
            Section {
                Text("")
            }
            Section {
                Text("")
            }
        }
    }

}

extension SettingCellModel {
    static var flyMode: SettingCellModel {
        .init(imageName: "airplane", primaryLabel: "Fly mode", color: .red)
    }
    
    static var wifi: SettingCellModel {
        .init(
            imageName: "wifi",
            primaryLabel: "Wifi",
            secondaryLabel: "Net-123",
            color: .blue
        )
    }
    
    static var cloud: SettingCellModel {
        .init(
            imageName: "icloud.fill",
            primaryLabel: "iCloud",
            secondaryLabel: "On",
            color: .cyan
        )
    }
    
    static var notifications: SettingCellModel {
        .init(imageName: "bell.badge.fill", primaryLabel: "Notifications", color: .orange)
    }
    
    static var general: SettingCellModel {
        .init(imageName: "gear", primaryLabel: "General", color: .gray)
    }
}
