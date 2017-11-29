//
//  CurrentSessionData.swift
//  RushApp
//
//  Created by Brian Li on 11/8/17.
//  Copyright © 2017 rush. All rights reserved.
//

struct CurrentUserData {
    static var CurrentUser: User = User()
}

struct CurrentGroupData {
    static var CurrentGroup: String = String()
    static var GroupMembers: [User] = [User]()
}

struct CurrentSchoolData {
    static var AllSchoolGroups: [String]!
}

