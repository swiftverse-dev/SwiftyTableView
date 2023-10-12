//
//  UserCellController.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

final class UserCellController: BaseCellDataSource<UserTableViewCell> {
    
    override func configure(cell: UserTableViewCell) {
        cell.primaryLabel.text = "John Doe"
        cell.secondaryLabel.text = "ID Apple, iCloud"
        cell.profileImageView.image = UIImage(resource: .profile)
    }
}

extension UserCellController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
