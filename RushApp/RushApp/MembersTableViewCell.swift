//
//  MembersTableViewCell.swift
//  RushApp
//
//  Created by Simran Singh on 11/20/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class MembersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userStatus: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
