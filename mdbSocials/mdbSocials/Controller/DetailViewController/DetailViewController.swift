//
//  DetailViewController.swift
//  mdbSocials
//
//  Created by Colin Zhou on 2020-02-29.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var eventDisplayed: Event!

    @IBOutlet weak var eventname: UILabel!
    @IBOutlet weak var postedby: UILabel!
    @IBOutlet weak var eventpic: UIImageView!
    @IBOutlet weak var rsvpNum: UILabel!
    @IBOutlet weak var eventDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventname.text = eventDisplayed.name
        postedby.text = eventDisplayed.name
        eventpic.UIImageView = eventDisplayed.image
        rsvpNum.text = eventDisplayed.numRSVP
        eventDesc.text = eventDisplayed.desc
        // Do any additional setup after loading the view.
    }
    
    @IBAction func interested(_ sender: Any) {
        let db = Database.database().reference()
        let eventNode = db.child("Events")
        
        guard let key = db.child("Events").childByAutoId().key else { return }
        let childUpdates = ["numRSVP": num+1]
        ref.updateChildValues(childUpdates)
    }
}
