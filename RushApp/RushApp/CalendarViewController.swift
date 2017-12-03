//
//  CalendarViewController.swift
//  RushApp
//
//  Created by Brian Jordan on 11/29/17.
//  Copyright © 2017 rush. All rights reserved.
//
import GoogleAPIClientForREST
import GoogleSignIn
import UIKit

class CalendarViewController: UIViewController {
    /*
    private let scopes = [kGTLRAuthScopeCalendarReadonly]
    
    private let service = GTLRService()
        //GTLRCalendarService()
    let output = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.frame = view.bounds
        output.isEditable = false
        output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        output.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        output.isHidden = true
        view.addSubview(output);
        
        // Do any additional setup after loading the view.
    }
    
    func fetchEvents() {
        let query = GTLRCalendarQuery_EventsList.query(withCalendarID: "primary")
        query.maxResults = 10
        query.timeMin = GTLRDateTime(date: Date())
        query.singleEvents = true
        query.orderBy = kGTLRCalendarOrderByStartTime
        service.executeQuery(
            query,
            delegate: self,
            didFinish: #selector(displayResultsWithTicket(ticket:finishedWithObject:error:)))
    }
    
    func displayResultsWithTicket(ticket: GTLRServiceTicket, finishedWithObject response: GTLRCalendar_Events, error : NSError?){
        
        if let error = error {showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        var outputText = ""
        if let events = response.items, !events.isEmpty{
            for event in events {
                let start = event.start!.dateTime ?? event.start!.date!
                let startString = DateFormatter.localizedString(from: start.date, dateStyle: .short, timeStyle: .short)
                outputText += "\(startString) - \(event.summary!)\n"
            }
        }
        else {
            outputText = "No upcoming events found."
        }
        output.text = outputText
    }
    
    func showAlert(title : String, message : String) {
        let alert = UIAlertController(title : title, message : message, preferredStyle : UIAlertControllerStyle.alert)
        let ok = UIAlertAction( title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
}
