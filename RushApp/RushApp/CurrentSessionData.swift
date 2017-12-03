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
    static var SelectedMember: User = User()
    static var GroupMembers: [User] = [User]()
}

struct CurrentSchoolData {
    static var CurrentSchool: String!
    static var AllSchoolGroups: [String]!
}

struct GlobalData {
    static var AllSchools: [String]!
}

