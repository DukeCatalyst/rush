//
//  CurrentSessionData.swift
//  RushApp
//
//  Created by Brian Li on 11/8/17.
//  Copyright © 2017 rush. All rights reserved.
//

struct CurrentSessionData {
    static var CurrentUser: User = User()
    static var GroupMembers: [User] = [User]()
    static var CurrentGroup: String = String()
    static var SelectedMember: User = User()
}
