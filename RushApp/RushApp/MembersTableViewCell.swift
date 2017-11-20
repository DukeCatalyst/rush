//
//  MembersTableViewCell.swift
//  RushApp
//
//  Created by Simran Singh on 11/20/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class MembersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserStatus: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
