//
//  FirebaseClient.swift
//  RushApp
//
//  Created by Brian Li on 12/3/17.
//  Copyright © 2017 rush. All rights reserved.
//

import Firebase
import FirebaseDatabase

class FirebaseClient {
    
    var ref: DatabaseReference = Database.database().reference()
    
    fileprivate static var sharedInstance = FirebaseClient()
    
    class func sharedClient() -> FirebaseClient {
        return sharedInstance
    }
    
    func getAllSchoolGroups(_ completionHandlerForGetAllSchoolGroups: @escaping (_ succeeded: Bool, _ error: NSError?) -> Void) {
        ref.child("schools").child(CurrentSchoolData.CurrentSchool).child("Organizations").observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.exists() {
                let schoolGroups = snapshot.value as? [String:AnyObject]
                
                for (groupName, groupInfo) in schoolGroups! {
                    if(groupName == "allOrganizations") {
                        CurrentSchoolData.AllSchoolGroupNames = groupInfo as! [String]
                    } else {
                        let groupInfoDict = groupInfo as! [String:AnyObject]
                        CurrentSchoolData.AllSchoolGroups[groupName] = Group(dict: groupInfoDict)
                    }
                }
                completionHandlerForGetAllSchoolGroups(true, nil)
            } else {
                completionHandlerForGetAllSchoolGroups(false, nil)
            }
        })
    }
    
    func getAllCurrentGroupData(_ completionHandlerForgetAllCurrentGroupData: @escaping (_ succeeded: Bool, _ error: NSError?) -> Void) {
        
        // get all Members data
        for memberName in (CurrentSchoolData.AllSchoolGroups[CurrentGroupData.CurrentGroup]?.Members["GID"])! {
            ref.child("allUsers").child("GID").child(memberName).observe(DataEventType.value, with: { (snapshot) in
                
                if snapshot.exists() {
                    CurrentGroupData.GroupMembers.append(User(dict: (snapshot.value as? [String: AnyObject])!))
                } else {
                    completionHandlerForgetAllCurrentGroupData(false,nil)
                }
            })
        }
        
        // get all Rushees data
        for rusheeName in (CurrentSchoolData.AllSchoolGroups[CurrentGroupData.CurrentGroup]?.Rushees["GID"])! {
            ref.child("allUsers").child("GID").child(rusheeName).observe(DataEventType.value, with: { (snapshot) in
                
                if snapshot.exists() {
                    CurrentGroupData.GroupRushees.append(User(dict: (snapshot.value as? [String: AnyObject])!))
                } else {
                    completionHandlerForgetAllCurrentGroupData(false,nil)
                }
            })
        }
        
        completionHandlerForgetAllCurrentGroupData(true,nil)
        
        print("\nshould work\n")
        dump(CurrentGroupData.GroupMembers)
    }
    
    /*
    func getAllSchoolGroups() {
        ref.child("schools").child(CurrentSchoolData.CurrentSchool).child("Organizations").observe(DataEventType.value, with: { (snapshot) in
            
            if snapshot.exists() {
                let schoolGroups = snapshot.value as? [String:AnyObject]
                
                for (groupName, groupInfo) in schoolGroups! {
                    if(groupName == "allOrganizations") {
                        CurrentSchoolData.AllSchoolGroupNames = groupInfo as! [String]
                    } else {
                        let groupInfoDict = groupInfo as! [String:AnyObject]
                        CurrentSchoolData.AllSchoolGroups[groupName] = Group(dict: groupInfoDict)
                    }
                }
            } else {
            }
        })
        
    }
 */
    
}
