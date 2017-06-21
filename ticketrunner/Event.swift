//
//  Event.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

class Event: NSObject {
    
    var id: NSNumber?
    var date: String?
    var name: String?
    
    var eventDescription: String?
    var videoLink: String?
    var facebookPageLink: String?
    var ticketingLink: String?
    
    var publishMessage: String?
    
    var commissionPercentage: Int?
    var eventCategoryId: Int?
    var isActive: Bool?
    
    var totalTickets: Int?
    var invited: Int?
    var maybe: Int?
    var attendence: Int?
    
    var longitude: Float?
    var latidute: Float?
    
    var slug: String?
    
    var pictureFileName: String?
    var pictureContentType: String?
    var pictureFileSize: NSNumber?
    var pictureUpdatedAt: String?
    
    var isBlocked: Bool?
    
    var ticketPriceFrom: NSNumber?
    var ticketPriceTo: NSNumber?
    
    var userId: Int?
    
    var createdAt: String?
    var updatedAt: String?
    
    var underReview: Bool?
    var totalFreeTickets: Int?
    
    var rewardsEnabled: Bool?
    var commissionEnabled: Bool?
    
    var rewards: [Reward]?
    var artists: [Artist]?
    
}
