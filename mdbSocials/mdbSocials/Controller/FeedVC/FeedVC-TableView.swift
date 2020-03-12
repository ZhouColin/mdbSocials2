//
//  FeedVC-TableView.swift
//  mdbSocials
//
//  Created by Colin Zhou on 2020-02-29.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

extension FeedViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FeedViewTableViewCell
        
        cell.nameLabel.text = friendsList[index]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath[1]
        let cellSelected = arrayOfEvents[index]
        let event = Event.init(name: cellSelected.name, memberWhoPosted: cellSelected.memberWhoPosted, numRSVP: cellSelected.numRSVP, image: cellSelected.image, desc: cellSelected.desc)
        selectedEvent = event
        performSegue(withIdentifier: "toDetailView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
