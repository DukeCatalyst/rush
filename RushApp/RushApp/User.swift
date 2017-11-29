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
    var year: String
    var birthday: String
    var techInterests: String
    var otherInterests: String
    var contact: String
    var memberGroups: [String]!
    var rushGroups: [String]!
    
    override init() {
        userID = ""
        firstName = ""
        lastName = ""
        school = ""
        year = ""
        techInterests = ""
        otherInterests = ""
        contact = ""
        birthday = ""
    }
    
    init(userID: String, firstName: String, lastName: String, school: String, year: String, techInterests: String, contact: String, otherInterests: String, birthday: String) {
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
        self.school = school
        self.year = year
        self.techInterests = techInterests
        self.otherInterests = otherInterests
        self.birthday = birthday
        self.contact = contact
        self.memberGroups = "Catalyst,ThetaRhoPhi".components(separatedBy: ",")
        self.rushGroups = "Catalyst,Frat,SigmaKappaLambda".components(separatedBy: ",")
    }
    
    init(dict: [String: AnyObject]) {
        self.userID = dict["userID"] as! String
        self.firstName = dict["firstName"] as! String
        self.lastName = dict["lastName"] as! String
        self.school = dict["school"] as! String
        self.userID = dict["userID"] as! String
        self.year = dict["tear"] as! String
        self.techInterests = dict["techInterests"] as! String
        self.otherInterests = dict["otherInterests"] as! String
        self.birthday = dict["birthday"] as! String
        self.contact = dict["contact"] as! String
        self.memberGroups = "Catalyst,ThetaRhoPhi".components(separatedBy: ",")
        self.rushGroups = "Catalyst,Frat,SigmaKappaLambda".components(separatedBy: ",")
    }
    
    func toDictionary() -> [String: AnyObject] {
        return ["userID": userID as AnyObject, "firstName": firstName as AnyObject, "lastName": lastName as AnyObject, "year": school as AnyObject, "techInterests": school as AnyObject, "otherInterests": school as AnyObject, "birthday": school as AnyObject, "contact": school as AnyObject]
    }
}
