//
//  MembersTableViewController.swift
//  RushApp
//
//  Created by Simran Singh on 11/12/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class MembersTableViewController: UITableViewController {

    var users: [User] = CurrentGroupData.GroupMembers
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MembersTableViewCell
        cell.UserName.text = "Test"
        cell.UserStatus.text = "Test"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CurrentGroupData.SelectedMember = CurrentGroupData.GroupMembers[indexPath.row]
        performSegue(withIdentifier: "selected-member", sender: self)
    }
}
