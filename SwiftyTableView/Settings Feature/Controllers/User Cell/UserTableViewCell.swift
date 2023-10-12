//
//  UserTableViewCell.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) weak var profileImageView: UIImageView!
    @IBOutlet private(set) weak var primaryLabel: UILabel!
    @IBOutlet private(set) weak var secondaryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 30
    }
}
