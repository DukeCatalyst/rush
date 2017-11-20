//
//  MembersTableViewController.swift
//  RushApp
//
//  Created by Simran Singh on 11/12/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class MembersTableViewController: UITableViewController {

    var users: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = ["Simran", "Brian", "Brian", "Nikki"]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        CurrentGroupData.SelectedMember = CurrentGroupData.GroupMembers[indexPath.row]
    }
}
