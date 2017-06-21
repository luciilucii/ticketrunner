//
//  Message.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 18.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class Message: NSObject {
    
    var fromId: String?
    var text: String?
    var timestamp: NSNumber?
    var toId: String?
    
    var imageUrl: String?
    
    var imageHeight: NSNumber?
    var imageWidth: NSNumber?
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        fromId = dictionary["fromId"] as? String
        text = dictionary["text"] as? String
        timestamp = dictionary["timestamp"] as? NSNumber
        toId = dictionary["toId"] as? String
        
        vonMir = dictionary["vonMir"] as? Bool
        
        imageUrl = dictionary["imageUrl"] as? String
        imageHeight = dictionary["imageHeight"] as? NSNumber
        imageWidth = dictionary["imageWidth"] as? NSNumber
        
    }
    
    var vonMir: Bool?
}
