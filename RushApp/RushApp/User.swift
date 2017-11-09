//
//  User.swift
//  RushApp
//
//  Created by Brian Li on 11/8/17.
//  Copyright © 2017 rush. All rights reserved.
//

import Foundation

class User: NSObject {
    var userID: String
    var firstName: String
    var lastName: String
    var school: String
    var groups: [String]!
    var rushGroups: [String]!
    
    override init() {
        userID = ""
        firstName = ""
        lastName = ""
        school = ""
    }
    
    init(userID: String, firstName: String, lastName: String, school: String) {
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.school = school
    }
    
    init(dict: [String: AnyObject]) {
        self.userID = dict["userID"] as! String
        self.firstName = dict["firstName"] as! String
        self.lastName = dict["lastName"] as! String
        self.school = dict["school"] as! String
    }
    
    func toDictionary() -> [String: AnyObject] {
        return ["userID": userID as AnyObject, "firstName": firstName as AnyObject, "lastName": lastName as AnyObject, "school": school as AnyObject]
    }
}
