//
//  Group.swift
//  RushApp
//
//  Created by Brian Li on 12/2/17.
//  Copyright © 2017 rush. All rights reserved.
//

import Foundation

class Group: NSObject {
    var Members: [String:[String]]
    var Rushees: [String:[String]]
    var Description: String
    
    init(dict: [String: AnyObject]) {
        self.Members = ["GID": (dict["Members"]!["GID"] as! [String])]
        self.Rushees = ["GID": (dict["Rushees"]!["GID"] as! [String])]
        self.Description = dict["Description"] as! String
    }
    
    func toDictionary() -> [String: AnyObject] {
        return ["Members": Members as AnyObject, "Rushees": Rushees as AnyObject, "Description": Description as AnyObject]
    }
}
