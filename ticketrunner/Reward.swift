//
//  Reward.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

class Reward {
    
    var id: Int
    var name: String?
    var iconName: String?
    var rewardDescription: String?
    
    var ticketsToSell: Int?
    
    var claimed = false
    
    init(id: Int) {        
        self.id = id
    }
    
}
