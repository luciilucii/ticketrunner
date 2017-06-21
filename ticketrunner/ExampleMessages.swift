//
//  ExampleMessages.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 19.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ExampleMessages: NSObject {
    
    func getMessages() -> [Message] {
        let message1 = Message(dictionary: ["fromId": 2345 as AnyObject, "text": "Wow, was ein cooler Chat" as AnyObject, "vonMir": false as AnyObject])
        let message2 = Message(dictionary: ["fromId": 2345 as AnyObject, "text": "Okay, jetzt kommt die 2te Nachricht" as AnyObject, "vonMir": false as AnyObject])
        let message3 = Message(dictionary: ["fromId": 2345 as AnyObject, "text": "Flo is der Hammer!" as AnyObject, "vonMir": true as AnyObject])
        let message4 = Message(dictionary: ["fromId": 2345 as AnyObject, "text": "Luca, sowas aber auch" as AnyObject, "vonMir": false as AnyObject])
        let message5 = Message(dictionary: ["fromId": 2345 as AnyObject, "text": "Der ist wirklich cool! :)" as AnyObject, "vonMir": true as AnyObject])
        
        return [message1, message2, message3, message4, message5]
    }
    
}
