//
//  Event.swift
//  mdbSocials
//
//  Created by Colin Zhou on 2020-02-29.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit

class Event {
    var name: String
    var memberWhoPosted: String
    var numRSVP: Int
    var image: UIImage
    var desc: String
    
    init(name: String, memberWhoPosted: String, numRSVP: Int, image: UIImage, desc: String) {
        self.name = name
        self.memberWhoPosted = memberWhoPosted
        self.numRSVP = numRSVP
        self.image = image
        self.desc = desc
    }
}

