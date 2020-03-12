//
//  FeedViewVC.swift
//  mdbSocials
//
//  Created by Colin Zhou on 2020-02-29.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit
import Firebase

class FeedViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayOfEvents()
        
        db = Firestore.firestore()
    }
    
    var arrayOfEvents: [Event]!
    var selectedEvent: Event!
    
    func setupArrayOfEvents() {
        
        let db = Database.database().reference()
        let eventNode = db.child("Events")
        eventNode.observe(of: .value) { (snapshot) in
            guard let eventDict = snapshot.value as? [String: [String: Any]] else {
                print("eventDict error")
                return
            }
            for(_, detail) in eventDict {
                
                let eventName : String = detail["name"]
                let memberWhoPosted : String = detail["madeBy"]
                let imageID : Int = detail["imageID"]
                let numRSVP : Int = detail["numRSVP"]
                let desc : String = detail["name"]
                
                let event = Event(name: eventName, memberWhoPosted: memberWhoPosted, numRSVP: numRSVP, image: imageID, desc: desc)
                self.arrayOfEvents.append(event)
                
            }
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addEvent(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let destination = segue.destination as! DetailViewController
            
            //change DetailView's parameters
            destination.eventDisplayed = selectedEvent
        }
    }
    
}
