//
//  User.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var id: Int?
    var uid: String?
    var lastname: String?
    var middlename: String?
    var firstname: String?
    var email: String?
    
    var gender: String?
    var phoneNumber: Int?
    var isActive: Bool?
    var isBlocked: Bool?
    
    var createdAt: String?
    var updatedAt: String?
    
    var dateOfBirth: String?
    var website: String?
    var language: String?
    
    var myEvents: [Event]?
    
}
